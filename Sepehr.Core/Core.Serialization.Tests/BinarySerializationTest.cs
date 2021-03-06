﻿using Core.Serialization.BinaryConverters;
using Core.Serialization.Test;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Newtonsoft.Json;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using static Core.Serialization.Test.ObjectMetadataTests;

namespace Core.Serialization.Tests
{
    [TestClass]
    public class BinarySerializationTest
    {
        private ConcurrentDictionary<int, User<IUserRole>> aa;
        private List<IUserRole> listDetails;
        private List<IUserRole> listSelectedDetails;

        [TestMethod]
        public void AnonymousTypeIntegrateTestForBinarySerializeDeserialize()
        {
            var obj = new { Id = 10, Name = "Hello" };
            var j = Newtonsoft.Json.JsonConvert.SerializeObject(obj);
            var res = Newtonsoft.Json.JsonConvert.DeserializeObject(j, obj.GetType());

            var a = BinaryConverter.Serialize(obj);
            // var c = BinaryConverter.Deserialize(a, obj.GetType().GetProperty().SetValue);
            // Assert.AreEqual(c, dt);
        }

        [TestMethod]
        public void DateTimeIntegrateTestForBinarySerializeDeserialize()
        {
            // var str = "6/21/2017 6:47:32 PM";
            // var dt =  DateTime.Parse(str);
            var dt = DateTime.Now;
            var a = BinaryConverter.Serialize(dt);
            var c = (DateTime)BinaryConverter.Deserialize(a, typeof(DateTime));
            // Assert.AreEqual(c, dt);
        }

        [TestMethod]
        public void FullyTrusted()
        {
            Assert.IsTrue(BinaryConverterBase.FullyTrusted);
        }

        [TestMethod]
        public void GetBinaryConverterByType()
        {
            var ListBinaryConverter = BinaryConverterBase.GetBinaryConverter(typeof(List<int>));
            Assert.AreEqual(ListBinaryConverter.GetType(), typeof(ListBinaryConverter));

            var ListBinaryConverter1 = BinaryConverterBase.GetBinaryConverter(typeof(List<User<UserRole>>));
            Assert.AreEqual(ListBinaryConverter1.GetType(), typeof(ListBinaryConverter));

            var dicBinaryConverter = BinaryConverterBase.GetBinaryConverter(typeof(Dictionary<int, string>));
            Assert.AreEqual(dicBinaryConverter.GetType(), typeof(DictionaryBinaryConverter));

            var Dic1BinaryConverter = BinaryConverterBase.GetBinaryConverter(typeof(ConcurrentDictionary<int, User<UserRole>>));

            Assert.AreEqual(Dic1BinaryConverter.GetType(), typeof(DictionaryBinaryConverter));

            var anonmousTypeBinaryConverter = BinaryConverterBase.GetBinaryConverter(new { Id = 10, Name = "ajkhjgf" }.GetType());
            Assert.AreEqual(anonmousTypeBinaryConverter.GetType(), typeof(UserDefinedTypeBinaryConverter));

            var userDefinedBinaryConverter = BinaryConverterBase.GetBinaryConverter(typeof(UserDefined));
            Assert.AreEqual(userDefinedBinaryConverter.GetType(), typeof(UserDefinedTypeBinaryConverter));

            var entityBinaryConverter = BinaryConverterBase.GetBinaryConverter(typeof(User<UserRole>));
            Assert.AreEqual(entityBinaryConverter.GetType(), typeof(UserDefinedTypeBinaryConverter));

            var intBinaryConverter = BinaryConverterBase.GetBinaryConverter(typeof(int));
            Assert.AreEqual(intBinaryConverter.GetType(), typeof(IntBinaryConverter));

            var nulIntBinaryConverter = BinaryConverterBase.GetBinaryConverter(typeof(int?));
            Assert.AreEqual(nulIntBinaryConverter.GetType(), typeof(IntBinaryConverter));

            var bytearrayBinaryConverter = BinaryConverterBase.GetBinaryConverter(typeof(byte[]));
            Assert.AreEqual(bytearrayBinaryConverter.GetType(), typeof(ByteArrayBinaryConverter));

            var chararrayBinaryConverter = BinaryConverterBase.GetBinaryConverter(typeof(char[]));
            Assert.AreEqual(chararrayBinaryConverter.GetType(), typeof(CharArrayBinaryConverter));

            var arrayBinaryConverter = BinaryConverterBase.GetBinaryConverter(typeof(UserDefined[]));
            Assert.AreEqual(arrayBinaryConverter.GetType(), typeof(ArrayBinaryConverter));
            var userUndefinedBinaryConverter = BinaryConverterBase.GetBinaryConverter(typeof(Point));
            Assert.AreEqual(userUndefinedBinaryConverter.GetType(), typeof(UserDefinedTypeBinaryConverter));
        }

        [TestInitialize]
        public void init()
        {
            var count = 1000;
            var countOfDetails = 100;
            aa = new ConcurrentDictionary<int, User<IUserRole>>();
            //  var ii = 123456;
            var random = new Random();
            listDetails = new List<IUserRole>();
            for (int j = 0; j < countOfDetails; j++)
            {
                listDetails.Add(new UserRole { Id = j, TestEnum2 = TestEnum2.e, User = new User<UserRole> { Email = "saeedcheginy@yahoo.com" }, Role = new Role { Id = 10 }, SomeArray = new int[] { 0, 1, 2, 3, 4, 5, 6 } });
            }
            for (int ii = 0; ii < count; ii++)
            {
                var lst = new List<IUserRole>() { null, listDetails[random.Next(0, listDetails.Count - 1)], new UserRole { Id = ii + 1, TestEnum2 = TestEnum2.c, SomeArray = new int[] { 0, 1, 2, 3, 4, 5, 6 } } };
                aa.TryAdd(ii, new User<IUserRole>
                {
                    TestEnum = TestEnum.b,
                    HashSet = new HashSet<UserDefined>(),
                    UserDefined = new Test.ObjectMetadataTests.UserDefined()
                    {
                        Id = ii,
                        Name = ii.ToString(),
                        Date1 = DateTime.Now,
                        ClassCount = 22,
                        Grade = (decimal)0.3254587,
                        LongId = 74108520410,
                        Mony = (float)0.245788,
                        Pint = new Point() { X = 10, Y = 54 },
                        HashSet = new HashSet<UserDefined>() { new UserDefined() { Id = 45874 } }
                    },
                    Id = random.Next(1, 10000000),
                    FName = "saeed" + ii,
                    LName = "چگینی dfgdfgfh" + ii,
                    UserRoles = lst
                });
            }

            listSelectedDetails = aa.Values.ToList().Select(user => user.UserRoles[1]).GroupBy(ur => ur).Select(ur => ur.Key).ToList();
        }

        [TestMethod]
        public void IntegrateTestForBinarySerializeDeserialize()
        {
            var a = BinaryConverter.Serialize(aa);
            var c = BinaryConverter.Deserialize(a, typeof(ConcurrentDictionary<int, User<UserRole>>)) as ConcurrentDictionary<int, User<IUserRole>>;
            var nullCheckBinary = BinaryConverter.Serialize(null);
            var nullCheck = BinaryConverter.Deserialize(nullCheckBinary, typeof(ConcurrentDictionary<int, User<UserRole>>)) as ConcurrentDictionary<int, User<UserRole>>;
            Assert.AreEqual(nullCheck, null);
            var dic = new Dictionary<object, int>();
            for (var i = 0; i < aa.Count; i++)
            {
                Assert.AreEqual(aa[i].Active, c[i].Active);
                Assert.AreEqual(aa[i].CompanyChartId, c[i].CompanyChartId);
                Assert.AreEqual(aa[i].Count, c[i].Count);
                Assert.AreEqual(aa[i].Email, c[i].Email);
                Assert.AreEqual(aa[i].FName, c[i].FName);
                Assert.AreEqual(aa[i].Id, c[i].Id);
                Assert.AreEqual(aa[i].LName, c[i].LName);
                Assert.AreEqual(((UserRole)aa[i].UserRoles[1]).Id, ((UserRole)c[i].UserRoles[1]).Id);
                Assert.AreEqual(((UserRole)aa[i].UserRoles[1]).User.Email, ((UserRole)c[i].UserRoles[1]).User.Email);
                Assert.AreEqual(null, c[i].UserRoles[0]);
                Assert.AreEqual(aa[i].UserDefined.Id, c[i].UserDefined.Id);
                Assert.AreEqual(aa[i].UserDefined.Date1, c[i].UserDefined.Date1);
                Assert.AreEqual(aa[i].UserDefined.Date2, c[i].UserDefined.Date2);
                Assert.AreEqual(aa[i].UserDefined.Pint, c[i].UserDefined.Pint);
                Assert.AreEqual(aa[i].UserDefined.HashSet.First().Id, c[i].UserDefined.HashSet.First().Id);
                dic[c[i].UserRoles[1]] = 1;
            }

            Assert.AreEqual(dic.Count, listSelectedDetails.Count);
        }

        [TestMethod]
        public void NewtonSoftTestForComparision()
        {
            JsonSerializerSettings sets = new JsonSerializerSettings
            {
                PreserveReferencesHandling = PreserveReferencesHandling.Objects,
                TypeNameHandling= TypeNameHandling.All
            };

            var ser = JsonSerializer.Create(sets);
            var str = new StringWriter();
            var writer = new JsonTextWriter(str);
            ser.Serialize(writer, aa);
            var strR = new StringReader(str.ToString());
            var reader = new JsonTextReader(strR);
            var c = ser.Deserialize(reader, typeof(ConcurrentDictionary<int, User<IUserRole>>)) as ConcurrentDictionary<int, User<IUserRole>>;
            var dic = new Dictionary<object, int>();
            for (var i = 0; i < aa.Count; i++)
            {
                Assert.AreEqual(aa[i].Active, c[i].Active);
                Assert.AreEqual(aa[i].CompanyChartId, c[i].CompanyChartId);
                Assert.AreEqual(aa[i].Count, c[i].Count);
                Assert.AreEqual(aa[i].Email, c[i].Email);
                Assert.AreEqual(aa[i].FName, c[i].FName);
                Assert.AreEqual(aa[i].Id, c[i].Id);
                Assert.AreEqual(aa[i].LName, c[i].LName);
                Assert.AreEqual(((UserRole)aa[i].UserRoles[1]).Id, ((UserRole)c[i].UserRoles[1]).Id);
                Assert.AreEqual(((UserRole)aa[i].UserRoles[1]).User.Email, ((UserRole)c[i].UserRoles[1]).User.Email);
                Assert.AreEqual(null, c[i].UserRoles[0]);
                Assert.AreEqual(aa[i].UserDefined.Id, c[i].UserDefined.Id);
                Assert.AreEqual(aa[i].UserDefined.Date1, c[i].UserDefined.Date1);
                Assert.AreEqual(aa[i].UserDefined.Date2, c[i].UserDefined.Date2);
                Assert.AreEqual(aa[i].UserDefined.Pint, c[i].UserDefined.Pint);
                Assert.AreEqual(aa[i].UserDefined.HashSet.First().Id, c[i].UserDefined.HashSet.First().Id);
                dic[c[i].UserRoles[1]] = 1;
            }
        }
    }
}