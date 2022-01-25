/**
* This tests the Spotless loader.
*/
component extends="tests.specs.BaseModuleTest" model="models.Loader"{


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

    function run(){

        describe( "ModuleConfig", function() {
            it( "can init", function() {
                expect( isInstanceOf( variables.model, "spotlessCF.models.Loader" ) ).toBeTrue();
            });

            it( "throws if Spotless jar is not found", function() {
                var mockLoader = getMockBox().createMock( "spotlessCF.models.Loader" );
                mockLoader.$( method = "initSpotless", callback = () => {
                    throw( type = "ClassNotFoundException" );
                } );
                expect( function() {
                    mockLoader.loadClass( "com.diffplug.spotless.Formatter" );
                } ).toThrow( "spotlessCF.MissingJarException" );
            });

            it( "can load Spotless formatter", function() {
                var mockLoader = getMockBox().createMock( "spotlessCF.models.Loader" );
                expect( function() {
                    var spotless = mockLoader.loadClass( "com.diffplug.spotless.Formatter" );
                    expect( isObject( spotless ) ).toBeTrue();
                } ).notToThrow( "spotlessCF.MissingJarException" );
            });

            it( "can load SQL formatter", function() {
                var mockLoader = getMockBox().createMock( "spotlessCF.models.Loader" );
                // expect( function() {
                    var formatter = mockLoader.getSQLFormatter();
                    writeDump( formatter );
                    expect( isObject( formatter ) ).toBeTrue();
                // } ).notToThrow( "spotlessCF.MissingJarException" );
            });
        } );


    }

}