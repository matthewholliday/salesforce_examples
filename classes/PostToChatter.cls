public with sharing class PostToChatter {
    public static void postComment(){
        Id communityId = null;
        Id sobjectId = '001f400000fqHj9AAE'; //CAN BE ANY OBJECT TYPE.
        String messageText = 'TEST MESSAGE';

        ConnectApi.FeedElement feedElement
                = ConnectApi.ChatterFeeds.postFeedElement(
                        communityId,
                        sobjectId,
                        ConnectApi.FeedElementType.FeedItem, //ALWAYS FEED ITEM
                        messageText);
    }
}