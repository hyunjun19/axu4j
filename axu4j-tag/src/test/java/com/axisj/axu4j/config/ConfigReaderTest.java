package com.axisj.axu4j.config;

import org.junit.Assert;
import org.junit.Test;

public class ConfigReaderTest{

    @Test
    public void testGetConfig(){
        AXUConfig config = ConfigReader.getConfig();
        Assert.assertNotNull(config);
        Assert.assertEquals("RUN", config.getMode());
    }
}