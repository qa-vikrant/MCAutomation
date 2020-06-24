package net.mc.tools.utilities;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.junit.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;

public class MongoDbConnection
{
    static MongoCollection<Document> userCollection, marketsCollection, phasingCollection,projectsCollection, audiencesCollection, surveysCollection, scenariosCollection, buyingAudiencesCollection, countriesCollection;
     List<Document> channelDocuments, planningKPITypesDocuments, countriesDocument, dataBaseDocument, clientsDocument;


    private static final Logger log = LoggerFactory.getLogger(MongoDbConnection.class);

    private static MongoClientURI uri = null;
    private static MongoClient mongoClient = null;
    private static MongoDatabase database = null;
    private static Object id;
    private static MongoCollection<Document> test;

    public static void connectTestDb() {
        uri = new MongoClientURI("mongodb+srv://testUserRead:uDqUVXYUejRjijEX@marketcube0-20ehl.gcp.mongodb.net/test-marketcube");
        mongoClient = new MongoClient(uri);
        database = mongoClient.getDatabase("test-marketcube");
        log.info("Connected to test database");
    }


    public MongoCollection queryRegisterUser() {
        log.info("******************************** users ************************************************");
        userCollection = database.getCollection("users");
        System.out.println(" users : " + userCollection.count());
        return userCollection;
    }
    public MongoCollection queryProducts() {
        log.info("******************************** users ************************************************");
        userCollection = database.getCollection("product");
        System.out.println(" users : " + userCollection.count());
        return userCollection;
    }
    public void fetchObjectId() {
//        String id = null;
//        List<Document> clientPolicies = (List<Document>) userCollection.find(and(eq("email.address", "vikrant.singh+250@successive.tech"), eq("isDeleted", false))).into(new ArrayList<Document>());
//      Document value= (Document) clientPolicies.get(0).get("_id");
//      System.out.println(value);
//
//        for (Document clientPolicy : clientPolicies) {
//            id = (String) clientPolicy.get("_id");
//            break;
//        }
//        return id;
        dataBaseDocument = userCollection.find(and(eq("email.address","vikrant.singh+250@successive.tech"))).into(new ArrayList<>());

        for (int dbData = 0; dbData < dataBaseDocument.size(); dbData++) {
            Object id = dataBaseDocument.get(dbData).get("_id");
            System.out.println(id);
            dataBaseDocument = userCollection.find(eq("_id", id)).into(new ArrayList<>());
            Assert.assertEquals(dataBaseDocument.size(), 1);
//            dataBaseDocument = dataBaseCollection.find().into(new ArrayList<>());
        }
//        break;
    }

    public static void main(String[] args)
    {
        connectTestDb();
        System.out.println(fetchObjectIdofEmail("vikrant.singh+250@successive.tech"));
    }

    public static Object fetchObjectIdofEmail(String emailaddress)
    {
        List<Document> dataBaseDocument = userCollection.find(and(eq("email.address",emailaddress))).into(new ArrayList<>());
        for (int dbData = 0; dbData < dataBaseDocument.size(); dbData++)
        {
            id = dataBaseDocument.get(dbData).get("_id");
            System.out.println(id);
            dataBaseDocument = userCollection.find(eq("_id", id)).into(new ArrayList<>());
            Assert.assertEquals(dataBaseDocument.size(), 1);
        }
        return id;
    }

    public void disconnectDb() {
        mongoClient.close();
        log.info("Database connection closed");
    }


}
