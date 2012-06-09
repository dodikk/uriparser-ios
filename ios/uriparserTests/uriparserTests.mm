#import "uriparserTests.h"
#import <uriparser/Uri.h>

#include <algorithm>

@implementation uriparserTests

-(void)testCanonicalUrlParsedCorretly
{
   UriParserStateA state;
   UriUriA uri;
   BOOL parseResult_ = NO;

   
   state.uri = &uri;
   parseResult_ = uriParseUriA(&state, "http://www.google.com:80/search?client=safari&rls=en&q=uriparser+example&ie=UTF-8&oe=UTF-8");   
   {
      STAssertTrue( parseResult_ == URI_SUCCESS, @"Unable to parse valid google URL" );
      
      
      BOOL shemeOk_ = std::equal( uri.scheme.first, uri.scheme.afterLast, "http" );
      STAssertTrue( shemeOk_, @"scheme mismatch" );
      
      
      BOOL hostOk_ = std::equal( uri.hostText.first, uri.hostText.afterLast, "www.google.com" );
      STAssertTrue( hostOk_, @"hostText mismatch" );
      
      BOOL portOk_ = std::equal( uri.portText.first, uri.portText.afterLast, "80" );
      STAssertTrue( portOk_, @"portText mismatch" );      
   }
   uriFreeUriMembersA(&uri);


}

@end
