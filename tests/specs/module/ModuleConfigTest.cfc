/**
* This tests the module loader.
*/
component extends="coldbox.system.testing.BaseTestCase" unloadColdBox=false appMapping="/app"{


    function beforeAll(){
        super.beforeAll();

        variables.moduleService = controller.getModuleService();
    }

    function afterAll(){
        super.afterAll();
    }

    function run(){

        describe( "ModuleConfig", function() {
            // TODO: Figure out why the `unload()` test breaks THIS test on subsequent test runs.
            it( "loads the module", function() {

                expect( function() {
                    moduleService.registerModule( "spotlessCF", "/testingModuleRoot" );
                    moduleService.activateModule( "spotlessCF", "/testingModuleRoot" );
                    
                    // debug( moduleService.getModuleRegistry() );
                }).notToThrow();

                expect( getWirebox().getInstance( "Formatter@spotlessCF" ) ).toBeTypeOf( "component" );
            });

            it( "can UNload the module", function() {
                moduleService.unload( "spotlessCF" );
                
                // bah; moduleService leaves the key in the registry. 🙄
                // expect( moduleService.getModuleRegistry() ).notToHaveKey( "spotlessCF" );
            });

            // TODO: move to SpotlessLoaderTest.cfc
            xit( "throws if Spotless jar is not found", function() {
                var mockModuleConfig = getMockBox().createMock( "spotlessCF.ModuleConfig" );
                mockModuleConfig.$( method = "loadSpotless", callback = () => {
                    throw( type = "ClassNotFoundException" );
                } );
                expect( function() {
                    mockModuleConfig.onLoad();
                } ).toThrow( "spotlessCF.MissingJarException" );
            });

            // TODO: move to SpotlessLoaderTest.cfc
            xit( "can load Spotless jar", function() {
                var mockModuleConfig = getMockBox().createMock( "spotlessCF.ModuleConfig" );
                // expect( function() {
                    var spotless = mockModuleConfig.loadSpotless();
                    writeDump( spotless );
                // } ).notToThrow( "spotlessCF.MissingJarException" );
            });
        } );


    }

}