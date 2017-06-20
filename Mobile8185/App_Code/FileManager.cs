using System;
using System.Collections.Generic;
using System.IO;


public class FileManager
{
    public static T ReadFromBinaryFile<T>(string filePath)
    {
        using (Stream stream = File.Open(filePath, FileMode.OpenOrCreate))
        {
            if (stream.Length == 0)
                return default(T);

            var binaryFormatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();

            return (T)binaryFormatter.Deserialize(stream);
        }
    }

    public static void WriteToBinaryFile<T>(string filePath, T objectToWrite, bool append = false)
    {
        using (Stream stream = File.Open(filePath, append ? FileMode.Append : FileMode.Create))
        {
            var binaryFormatter = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
            binaryFormatter.Serialize(stream, objectToWrite);
        }
    }
}


