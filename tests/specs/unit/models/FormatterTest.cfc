/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="tests.specs.BaseModuleTest" model="models.Formatter"{

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();

		// setup the model
		super.setup();

		// init the model object
		model.init();
		
		// wire me up!
		getWirebox().autowire( model );
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){

		describe( "models/Formatter Suite", function(){
			it( "can initialize", function() {
				expect( isObject( variables.model ) ).toBeTrue();
			});

			it( "can format SQL", function() {
				var uglySQL = "SELECT * FROM pages ORDER BY [name]";
				var result = variables.model.formatSQL( uglySQL );
				expect( result ).toBeTypeOf( "string" );
				debug( result );
			});

		});

	}

}
