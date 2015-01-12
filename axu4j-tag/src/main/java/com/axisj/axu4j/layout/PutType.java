package com.axisj.axu4j.layout;

import java.io.IOException;
import java.io.Writer;

/**
 * 블럭에 대체되어 들어가는 타입

 * Author: KwonNam Son(kwon37xi@gmail.com)
 * 
 * @deprecated
 */
public enum PutType {
    APPEND {
        @Override
        public void write(Writer out, String bodyResult, String putContents) throws IOException {
            out.write(bodyResult);
            out.write(putContents);
        }
    },
    PREPEND {
        @Override
        public void write(Writer out, String bodyResult, String putContents) throws IOException {
            out.write(putContents);
            out.write(bodyResult);
        }
    },
    REPLACE {
        @Override
        public void write(Writer out, String bodyResult, String putContents) throws IOException {
            out.write(putContents);
        }
    };

    public abstract void write(Writer out, String bodyResult, String putContents) throws IOException;

}
