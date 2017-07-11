﻿using System;
using System.Collections;
using System.IO;
using System.Linq;

namespace Core.Serialization.BinaryConverters
{
    public class ListBinaryConverter : BinaryConverter<IList>
    {
        public BinaryConverterBase ElementItem { get; private set; }
        public Type ElementType { get; private set; }
        public override BinaryConverterBase Copy(Type type)
        {
            var binaryConverter = new ListBinaryConverter();
            binaryConverter.Init(type);
            binaryConverter.ElementType = type.GetGenericArguments().First();
            binaryConverter.ElementItem = GetBinaryConverter(binaryConverter.ElementType);
            return binaryConverter;
        }
        protected override IList DeserializeBase(BinaryReader reader, Type objectType, DeserializationContext context)
        {
            IList result;
            result = (IList)Activator.CreateInstance(objectType);
            var count = reader.ReadInt32();
            if (count > 0)
            {
                for (int i = 0; i < count; i++)
                {
                    var value = ElementItem.Deserialize(reader, ElementType, context);
                    result.Add(value);
                }
            }

            return result;
        }

        protected override void SerializeBase(IList objectItem, BinaryWriter writer, SerializationContext context)
        {
            writer.Write(objectItem.Count);
            foreach (var item in objectItem)
            {                
                SerializeChildItem(ElementItem, item, writer, context);
            }
        }
    }
}