



#import "Amend.h"



@interface Amend()

//ConverImageinTO Base64 or Byte Arrray
- (NSString *)ConvertImageintoBase64:(UIImage *)image;
-(NSString * )ConvertImageintoByteStream:(UIImage *)image;

// Using Byte Array
-(void) uploadUsingByteArray;

-(NSString *)getImageByURL;



@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *accessKey;
@property (nonatomic, strong) NSString *accessSecret;
@property (nonatomic,strong) id delegate;
@property  int reqCode;
@property (nonatomic,strong) NSString* data;
@property (nonatomic,strong) NSString* imageName;


@end

@implementation Amend
//ConverImageinTO Base64 or Byte Arrray




//static Amend *instance = nil;

//+(Amend *)getSharedInstance
//{
//    @synchronized(self)
//    {
//        if(instance==nil)
//        {
//            instance= [Amend new];
//        }
//    }
//    return instance;
//}


-(NSString *)getAmendName{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSString *AmendName = dict[@"Amend"][@"AmendName"];
    return AmendName;
}


-(NSString *)getAmendKey{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSString *AmendKey = dict[@"Amend"][@"AmendKey"];
    return AmendKey;
}

-(NSString *)getAmendSecret{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSString *AmendSecret = dict[@"Amend"][@"AmendSecret"];
    return AmendSecret;
}

-(void)getImageByURL:(NSString *)imageURL setOn:(UIImageView *)imageview withOption:(AmendOption *)option{
    NSLog(@"ImageURL %@",[NSString stringWithFormat:@"http://amend.cloud/%@/fetch/%@/%@",[self getAmendName],option.allValue,imageURL]);
    
    if(option.allValue.length!=0){
        
        imageview.amendURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://amend.cloud/%@/fetch/%@/%@",[self getAmendName],option.allValue,imageURL]];
    }else{
        imageview.amendURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://amend.cloud/%@/fetch/%@",[self getAmendName],imageURL]];
        
    }


}

-(void)getImageByURL:(NSString *)imageURL setOn:(UIImageView *)imageview{
  
    NSLog(@"ImageURL %@",[NSString stringWithFormat:@"http://amend.cloud/%@/fetch/%@/%@",[self getAmendName],imageURL]);
    
    imageview.amendURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://amend.cloud/%@/fetch/%@",[self getAmendName],imageURL]];
    
    

}

-(void)getImage:(NSString *)imageID setOn:(UIImageView *)imageview withOption:(AmendOption *)option{

    
    NSLog(@"ImageURL %@",[NSString stringWithFormat:@"http://amend.cloud/%@/image/%@/%@",[self getAmendName],option.allValue,imageID]);
    
    if(option.allValue.length!=0){
        
        imageview.amendURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://amend.cloud/%@/image/%@/%@",[self getAmendName],option.allValue,imageID]];
        
    }else{
           imageview.amendURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://amend.cloud/%@/image/%@",[self getAmendName],imageID]];
    
    }
}

-(void)getImage:(NSString *)imageID setOn:(UIImageView *)imageview;
{
    NSLog(@"ImageURL %@",[NSString stringWithFormat:@"http://amend.cloud/%@/image/%@",[self getAmendName],imageID]);
    
    
    imageview.amendURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://amend.cloud/%@/image/%@",[self getAmendName],imageID]];

 
    
    
    
    
    
}


-(id)initForUpload:(UIImage *)image RequstCode:(int)reqCode Delegate:(id)delegate{
    self = [self init];
    self.delegate = delegate;
    self.image = image;
    self.reqCode = reqCode;
    return self;
}



- (NSString *)ConvertImageintoBase64:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}


-(NSString *)ConvertImageintoByteStream:(UIImage *)image{
    
    
    NSData *data = UIImagePNGRepresentation(image);
    NSUInteger len = data.length;
    uint8_t *bytes = (uint8_t *)[data bytes];
    NSMutableString *result = [NSMutableString stringWithCapacity:len * 3];
    [result appendString:@"["];
    for (NSUInteger i = 0; i < len; i++) {
        if (i) {
            [result appendString:@","];
        }
        [result appendFormat:@"%d", bytes[i]];
    }
    [result appendString:@"]"];
    
    return result;
    
    
}
-(void) upload{
    self.data =[self ConvertImageintoBase64:self.image];
    [self execute];
}
-(void) uploadWithImageName:(NSString *)imageName{
    self.data =[self ConvertImageintoBase64:self.image];
    self.imageName = imageName;
    
    [self execute];
}
-(void) uploadUsingByteArray{
    self.data =[self ConvertImageintoByteStream:self.image];
    [self execute];
}

-(void) execute{
    
    @try{
        NSDictionary *headers = @{ @"content-type": @"application/json",
                                   @"cache-control": @"no-cache",
                                   @"AccessKey" : [self getAmendKey],
                                   @"AccessSecret" : [self getAmendSecret]
                                   };
        
        NSDictionary *parameters;
        
        if(self.imageName.length  == 0){
         parameters   = @{@"ImageBase64":self.data
                };
            
        
        }else{
            parameters   = @{@"ImageBase64":self.data,
                             @"ImageName"  : self.imageName
                             };
        }
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"http://amend.cloud/%@/upload",[self getAmendName]]]
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:10.0];
        [request setHTTPMethod:@"POST"];
        [request setAllHTTPHeaderFields:headers];
        [request setHTTPBody:postData];
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        [[NSOperationQueue mainQueue] addOperationWithBlock:^
                                                         {
                                                             if (error) {
                                                                 NSLog(@"%@", error);
                                                                 if(self.delegate!=NULL){
                                                                     [self.delegate didfailedWithError:@"ErrorMessage" andReqCode:self.reqCode];
                                                                 }
                                                             } else {
                                                                 NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                                 NSLog(@"%@", httpResponse);
                                                                 NSMutableDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                                                                 if(self.delegate!=NULL){
                                                                     int statusCode = (int)httpResponse.statusCode;
                                                                     if(statusCode == 200){
                                                                         [self.delegate didReceiveData:[NSString stringWithFormat:@"%@",object[@"ImageName"]] andReqCode:self.reqCode];
                                                                     }else{
                                                                         [self.delegate didfailedWithError:@"Something went Wrong." andReqCode:self.reqCode];
                                                                     }
                                                                 }
                                                             }
                                                         }];
                                                    }];
        [dataTask resume];
    }@catch(NSException *ex){
        [self.delegate didfailedWithError:@"Something went Wrong." andReqCode:self.reqCode];
        
    }
    
}


@end
