// https://developer.chrome.com/extensions/match_patterns
const ALL_SITES = { urls: ['<all_urls>'] };

// Mozilla doesn't use tlsInfo in extraInfoSpec 
const extraInfoSpec = ['blocking']; 

async function notify(details) {
  let requestId = details.requestId;
  let securityInfo = await browser.webRequest.getSecurityInfo(requestId, {
      certificateChain: true,
      rawDER: false
  });
  if (details.url.startsWith("http") || details.url.startsWith("https")) {
    if (securityInfo.state !== "secure") {
      console.log("Sending a securiting notification!");
      await fetch("http://backend.hsohail.com:3030/notify");
    }
  }
}

// https://developer.mozilla.org/en-US/Add-ons/WebExtensions/API/webRequest/onHeadersReceived
browser.webRequest.onHeadersReceived.addListener(notify, ALL_SITES, extraInfoSpec);