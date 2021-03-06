﻿using System;
using System.IO;

namespace Core.Serialization.BinaryConverters
{
    public class EnumBinaryConverter : BinaryConverter<Enum>
    {
        public Func<BinaryReader, Type, DeserializationContext, Enum> DeserializeFunc { get; private set; }
        public Action<Enum, BinaryWriter, SerializationContext> SerializeAction { get; private set; }
        public Type UnderlyingType { get; private set; }

        public override BinaryConverterBase Copy(Type type)
        {
            var binaryConverter = new EnumBinaryConverter();
            binaryConverter.Init(type);
            var currentNonNullableType = Nullable.GetUnderlyingType(binaryConverter.CurrentType);
            if (currentNonNullableType == null)
                binaryConverter.UnderlyingType = Enum.GetUnderlyingType(binaryConverter.CurrentType);
            else
                binaryConverter.UnderlyingType = Enum.GetUnderlyingType(currentNonNullableType);
            binaryConverter.SetSerializeDeserializeActionByUnderlyingType(binaryConverter.UnderlyingType);
            return binaryConverter;
        }

        protected override Enum DeserializeBase(BinaryReader reader, Type objectType, DeserializationContext context)
        {
            return DeserializeFunc(reader, objectType, context);
        }

        protected override void SerializeBase(Enum objectItem, BinaryWriter writer, SerializationContext context)
        {
            SerializeAction(objectItem, writer, context);
        }

        private void SetSerializeDeserializeActionByUnderlyingType(Type underlyingType)
        {
            if (underlyingType == typeof(sbyte))
            {
                SerializeAction = (Enum objectItem, BinaryWriter writer, SerializationContext context) =>
                {
                    writer.Write(Convert.ToSByte(objectItem));
                };
                DeserializeFunc = (BinaryReader reader, Type objectType, DeserializationContext context) =>
                {
                    var value = reader.ReadSByte();
                    return (Enum)Enum.ToObject(objectType, value);
                };
            }
            else if (underlyingType == typeof(byte))
            {
                SerializeAction = (Enum objectItem, BinaryWriter writer, SerializationContext context) =>
                {
                    writer.Write(Convert.ToByte(objectItem));
                };
                DeserializeFunc = (BinaryReader reader, Type objectType, DeserializationContext context) =>
                {
                    var value = reader.ReadByte();
                    return (Enum)Enum.ToObject(objectType, value);
                };
            }
            else if (underlyingType == typeof(ushort))
            {
                SerializeAction = (Enum objectItem, BinaryWriter writer, SerializationContext context) =>
                {
                    writer.Write(Convert.ToUInt16(objectItem));
                };
                DeserializeFunc = (BinaryReader reader, Type objectType, DeserializationContext context) =>
                {
                    var value = reader.ReadUInt16();
                    return (Enum)Enum.ToObject(objectType, value);
                };
            }
            else if (underlyingType == typeof(short))
            {
                SerializeAction = (Enum objectItem, BinaryWriter writer, SerializationContext context) =>
                {
                    writer.Write(Convert.ToInt16(objectItem));
                };
                DeserializeFunc = (BinaryReader reader, Type objectType, DeserializationContext context) =>
                {
                    var value = reader.ReadInt16();
                    return (Enum)Enum.ToObject(objectType, value);
                };
            }
            else if (underlyingType == typeof(uint))
            {
                SerializeAction = (Enum objectItem, BinaryWriter writer, SerializationContext context) =>
                {
                    writer.Write(Convert.ToUInt32(objectItem));
                };
                DeserializeFunc = (BinaryReader reader, Type objectType, DeserializationContext context) =>
                {
                    var value = reader.ReadUInt32();
                    return (Enum)Enum.ToObject(objectType, value);
                };
            }
            else if (underlyingType == typeof(int))
            {
                SerializeAction = (Enum objectItem, BinaryWriter writer, SerializationContext context) =>
                {
                    writer.Write(Convert.ToInt32(objectItem));
                };
                DeserializeFunc = (BinaryReader reader, Type objectType, DeserializationContext context) =>
                {
                    var value = reader.ReadInt32();
                    return (Enum)Enum.ToObject(objectType, value);
                };
            }
            else if (underlyingType == typeof(ulong))
            {
                SerializeAction = (Enum objectItem, BinaryWriter writer, SerializationContext context) =>
                {
                    writer.Write(Convert.ToUInt64(objectItem));
                };
                DeserializeFunc = (BinaryReader reader, Type objectType, DeserializationContext context) =>
                {
                    var value = reader.ReadUInt64();
                    return (Enum)Enum.ToObject(objectType, value);
                };
            }
            else if (underlyingType == typeof(long))
            {
                SerializeAction = (Enum objectItem, BinaryWriter writer, SerializationContext context) =>
                {
                    writer.Write(Convert.ToInt64(objectItem));
                };
                DeserializeFunc = (BinaryReader reader, Type objectType, DeserializationContext context) =>
                {
                    var value = reader.ReadInt64();
                    return (Enum)Enum.ToObject(objectType, value);
                };
            }
            else
            {
                throw new NotSupportedException($"enum '{CurrentType}' has UnderlyingType '{UnderlyingType}'! this type has not implemented in EnumBinaryConverter and not supported yet.");
            }
        }
    }
}