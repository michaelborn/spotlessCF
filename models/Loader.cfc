component {
    property name="spotlessVersion" inject="coldbox:setting:spotlessVersion@spotlessCF";

    public component function init(){
        return this;
    }
    
    /**
     * Test for spotless jar availability and throw an error if not available.
     * Used in module initialization.
     */
    public function ensureSpotlessAvailability(){
        try {
            var spotlessFormatter = loadSpotlessClass( "Formatter" );
        } catch( any exception ){
            throw(
                message      = "Cannot load Spotless.Formatter class; is the Spotless jar loaded?",
                type         = "spotlessCF.MissingJarException",
                detail       = "Trying to load com.diffplug.spotless.Formatter gave us an exception: #exception.message#",
                extendedInfo = serializeJSON( exception )
            );
        }
    }

    private any function load( required string className ){
        return createObject(
            type = "java",
            className = "com.diffplug.spotless.#arguments.className#",
            context = "/spotlessCF/lib/spotless-lib-#getSpotlessVersion()#/spotless-lib-#getSpotlessVersion()#.jar"
        );
    }
}