#!/bin/bash

# OpenBravo POS Startup Script (Fixed for Java 17)
# This script properly sets up the classpath to include all necessary resources

DIRNAME="$(cd "$(dirname "$0")" && pwd)"

# Build classpath
CP="$DIRNAME/build/jar/openbravopos.jar"

# Add all library JARs
for jar in "$DIRNAME"/lib/*.jar; do
    CP="$CP:$jar"
done

# Add locales and reports directories
CP="$CP:$DIRNAME/locales"
CP="$CP:$DIRNAME/reports"

# Detect library path based on OS
case "$(uname -s)" in
    Linux)
        case "$(uname -m)" in
            i686) LIBRARYPATH="$DIRNAME/lib/Linux/i686-unknown-linux-gnu";;
            ia64) LIBRARYPATH="$DIRNAME/lib/Linux/ia64-unknown-linux-gnu";;
            x86_64|amd64) LIBRARYPATH="$DIRNAME/lib/Linux/x86_64-unknown-linux-gnu";;
        esac;;
    Darwin) LIBRARYPATH="$DIRNAME/lib/Mac_OS_X";;
    CYGWIN*|MINGW32*) LIBRARYPATH="$DIRNAME/lib/Windows/i368-mingw32";;
esac

# Start OpenBravo POS
# Add --add-opens flags to fix JasperReports compilation issues on Java 9+
java -cp "$CP" \
     --add-opens java.base/java.lang=ALL-UNNAMED \
     --add-opens java.base/java.util=ALL-UNNAMED \
     --add-opens java.desktop/javax.swing=ALL-UNNAMED \
     -Djava.util.logging.config.file="$DIRNAME/logging.properties" \
     -Djava.library.path="$LIBRARYPATH" \
     -Ddirname.path="$DIRNAME/" \
     com.openbravo.pos.forms.StartPOS "$@"
