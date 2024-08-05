
function fn() {
  var env = karate.env; // get system property 'karate.env'
//env='stage';
  //karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'e2e';
  }
 // karate.configure('retry', {count :  5, interval:  5000})


  var config = {
  env: env,
  ccUrl: "http://localhost:9966/owners/find"

  }
  if (env == 'stage') {

   config = {
    env: env,
    ccUrl: "http://localhost:9966/petclinic/api/owners"

    }
  } else if (env == 'prepod') {
    config = {
        env: env,
        ccUrl: "http://localhost:9966/petclinic/api/pets"

        }
  }
  //config.accessToken = karate.callSingle('Callable1.feature')
  return config;
}
