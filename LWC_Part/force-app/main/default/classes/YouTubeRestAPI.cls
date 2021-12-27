global inherited sharing class YouTubeRestAPI {
    
    @InvocableMethod(label='UpdateYoutube')
    public static void updateYoutube(List<FlowInputs> VarflowInputs){
        getYoutubeDetails(VarflowInputs[0].recordId, VarflowInputs[0].videoId);
    }

    public class FlowInputs{
        @InvocableVariable(label='RecordId')
        public String recordId;
        @InvocableVariable(label='VideoId') 
        public String videoId;
    }
    
    public static void getYoutubeDetails(String recordId, String videoId){
        String apiKey = Settings__mdt.getInstance('API_Key').Value__c;
        String endpointURL = Settings__mdt.getInstance('Endpoint').Value__c;
        endpointURL += '?part=statistics';
        endpointURL += '&id='+videoId;
        endpointURL += '&key='+apiKey;

        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(endpointURL);

        Http http = new Http();
        HttpResponse response = http.send(request);

        Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        //kind => value
        //etags => value
        //items => array
        //pageInfo =>
        system.debug('responseMap: '+responseMap);
        List<Object> items = (List<Object>)responseMap.get('items');
        system.debug('items: '+items);

        Map<String, Object> item = (Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(items[0]));
        System.debug('item: '+item);

        Object statistics = item.get('statistics');
        System.debug('statistics: '+statistics);

        Map<String, Object> statisticsMap = (Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(statistics));
        System.debug('statisticsMap: '+statisticsMap);

        YoutubeSetting__c ytd = new YoutubeSetting__c();
        ytd.Id = recordId;
        if(statisticsMap.containsKey('likeCount')){
            ytd.Number_of_Likes__c = String.valueOf(statisticsMap.get('likeCount'));
        }
        if(statisticsMap.containsKey('viewCount')){
            ytd.Number_of_View_Counts__c = String.valueOf(statisticsMap.get('viewCount'));
        }
        update ytd;
    }

    
}

/*
 * This class runs the methods
 * that calls the YouTube API 
 * to get the details (likes,dislikes,comments,views) of
 * particular video that user want to see the video statistics 
 *
 */
/*
global class YouTubeVideoDetails {
         
         * This method Fetching the Encoded key and 
         * Endpoints by using the 
         * Custom Metadata 
         
    webService static void details( String videoId , String recId) {
        
        String enckey = You_Tube_API_Setting__mdt.getInstance( 'YouTube API Key' ).Value__c;
        String endpt  = You_Tube_API_Setting__mdt.getInstance( 'YouTube Endpoints' ).Value__c;
        endpt         = endpt.replace( '{API_KEY}', enckey );
        endpt         = endpt.replace( '{VIDEO_ID}', videoId );
                
        HttpRequest httpReq  = new HttpRequest();
        Http http            = new Http();
        HttpResponse httpRes = new HttPResponse();        
        httpReq.setMethod( 'GET' );
        httpReq.setEndpoint( endpt );        
        httpRes = http.send( httpReq );        
        JsonParser j = (JsonParser)JSON.deserialize(httpRes.getBody(),JsonParser.class);       
        Youtube_Video_Detail__c yv         = new Youtube_Video_Detail__c();
        yv.Id                       = recId;
        yv.Number_of_View_Counts__c = j.items[0].statistics.viewCount;//counts;
        yv.Number_of_Likes__c       = j.items[0].statistics.likeCount;
        yv.Number_of_Dislikes__c    = j.items[0].statistics.dislikeCount;
        yv.Number_of_Comments__c    = j.items[0].statistics.commentCount;        
        update yv;
    }
    public class JsonParser{
        public pageInfo pageInfo{get;set;}
        public String etag{get;set;}
        public list<items> items{get;set;}
        public String kind{get;set;}
    }
    public class statistics{
        public String viewCount{get;set;}
        public String likeCount{get;set;}
        public String dislikeCount{get;set;}
        public String favoriteCount{get;set;}
        public String commentCount{get;set;}
    }
    public class pageInfo{
        public Integer resultsPerPage{get;set;}
        public Integer totalResults{get;set;}
    }
    public class items{
        public String id{get;set;}
        public String etag{get;set;}
        public statistics statistics{get;set;}
        public String kind{get;set;}
    }
}
*/