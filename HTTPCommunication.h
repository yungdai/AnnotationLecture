//
//  HTTPCommunication.h
//  HTTPCommunication
//
//  Created by Kwame Bryan on 2015-05-03.
//  Copyright (c) 2015 Kwame Bryan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPCommunication : NSObject<NSURLSessionDownloadDelegate>
/*
 successBlock will contain the block you’re going to call when the request is completed.
 */
@property (copy, nonatomic) void (^successBlock)(NSData *);
/*
 Craft and send request using NSURLRequest and NSURLConnection
 */
- (void)retrieveURL:(NSURL *)url successBlock:(void (^)(NSData *))successBlock;
/*
 Task has finished downloading delegate method
 */
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location;
@end
