const seen = new Set();

async function getUrls() {
  // get all open tabs
  const tabs = await browser.tabs.query({});
  tabs.forEach(tab => {
    // extract the base url
    const pathArray = tab.url.split('/');
    const protocol = pathArray[0];
    const host = pathArray[2];
    const url = protocol + '//' + host;
  
    if (!seen.has(url)) {
      validateUrl(url);
    }
    
  });
}

async function validateUrl(url) {
  const urls = [
    "https://www.google.com",
    "https://www.youtube.com",
    "https://www.facebook.com",
    "https://www.amazon.com",
    "https://www.wikipedia.org",
    "https://www.twitter.com",
    "https://www.live.com",
    "https://www.instagram.com",
    "https://www.linkedin.com",
    "https://www.reddit.com",
    "https://www.ebay.com",
    "https://www.pinterest.com",
    "https://www.netflix.com",
    "https://www.microsoft.com",
    "https://www.wordpress.com",
    "https://www.tumblr.com",
    "https://www.paypal.com",
    "https://www.imgur.com",
    "https://www.stackoverflow.com",
    "https://www.aliexpress.com",
    "https://www.apple.com",
    "https://www.github.com",
    "https://www.imdb.com",
    "https://www.craigslist.org",
    "https://www.amazon.de",
    "https://www.dropbox.com",
    "https://www.alibaba.com",
    "https://www.alipay.com",
    "https://www.microsoftonline.com",
    "https://www.booking.com",
    "https://www.googleusercontent.com",
    "https://www.cnn.com",
    "https://www.twitch.tv",
    "https://www.accuweather.com"
  ];

  let validUrlSet = new Set(urls);
  if (!validUrlSet.has(url)) {
    console.log("Sending a securiting notification!")
    await fetch("http://backend.hsohail.com:3030/notify");
    seen.add(url);
  }
}

browser.tabs.onUpdated.addListener(getUrls);