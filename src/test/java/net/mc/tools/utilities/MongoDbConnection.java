package net.mc.tools.utilities;

import com.mongodb.*;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;


import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

public class MongoDbConnection
{
    private static final Logger log = LoggerFactory.getLogger(MongoDbConnection.class);

    static MongoClientURI uri = null;
    static MongoClient mongoClient = null;
    static MongoDatabase database = null;
    static MongoCollection<Document> test;

//    public void connectTestDb()
//    {
//        uri = new MongoClientURI("mongodb://userRead:uDqUVXYUejRjijEX@test-db1.marketcube.io:27017,test-db2.marketcube.io:27017,test-db3.marketcube.io:27017/marketcube?replicaSet=mongo&authSource=admin");
//        mongoClient = new MongoClient(uri);
//        database = mongoClient.getDatabase("test-marketcube");
//        System.out.println("Connected to test database");
//        log.info("Connected to test database");
//    }

    public void disconnectDb()
    {
        mongoClient.close();
        log.info("Database connection closed");
    }

    public static void main(String[] args)
    {
        uri = new MongoClientURI("mongodb://userRead:uDqUVXYUejRjijEX@test-db1.marketcube.io:27017,test-db2.marketcube.io:27017,test-db3.marketcube.io:27017/marketcube?replicaSet=mongo&authSource=admin");
        mongoClient = new MongoClient(uri);
        database = mongoClient.getDatabase("test-marketcube");
         test=database.getCollection("users");
        System.out.println("Connected to test database : "+database.getName());
        log.info("Connected to test database");


        FindIterable<Document> findIterable=test.find();
        MongoCursor<Document> cursor=findIterable.iterator();
        try
        {
         while (cursor.hasNext())
          {
              System.out.println();
         }
        }
        finally
        {

         mongoClient.close();
        }
    }

}
