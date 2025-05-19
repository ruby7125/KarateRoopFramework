function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
	username: 'admin',
	password: 'welcome',
	_url: 'http://localhost:9897'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
	config.username = 'author';
	config.password = 'visa2025';
	config._url = 'http://dev-localhost:9897';
  } else if (env == 'e2e') {
    // customize
	
	config.username = 'author2025';
	config.password = 'authorpassword';
  }
  else if (env == 'regression') {
      // Intialize the configuration
  	
  	config.username = 'regauthor2025';
  	config.password = 'regauthorpassword';
	config._url = 'http://reg-localhost:9897';
    }
	else if (env == 'staging') {
	    // Intialize the configuration
		
		config.username = 'stgauthor2025';
		config.password = 'stgauthorpassword';
		config._url = 'http://stg-localhost:9897';
	  }
	  else if (env == 'production') {
	 // Intialize the configuration
	  	
	  	config.username = 'stgauthor2025';
	  	config.password = 'stgauthorpassword';
		config._url = 'http://prod-localhost:9897';
	    }
  return config;
}