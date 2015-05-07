//
//  HTTPCommunication.m
//  HTTPCommunication
//
//  Created by Kwame Bryan on 2015-05-03.
//  Copyright (c) 2015 Kwame Bryan. All rights reserved.
//

#import "HTTPCommunication.h"

@implementation HTTPCommunication

-(void)retrieveURL:(NSURL *)url successBlock:(void (^)(NSData *))successBlock
{
    // persisting given successBlock for calling it later
    self.successBlock = successBlock;
    // creating the request using the given url
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    // creating a session using the default configuration and setting our instance as delegate
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf delegate:self delegateQueue:nil];
    // preparing the download task
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
    // establising the connection
    [task resume];
    
}
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    // Getting the downloaded data from the local storage
    NSData *data = [NSData dataWithContentsOfURL:location];
    // ensure that you call the successBlock from the main thread by using dispatch queues
    dispatch_async(dispatch_get_main_queue(), ^{
        // calling the block stored before as a callback
        self.successBlock(data);
    });
}


@end
