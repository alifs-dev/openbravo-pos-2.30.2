#!/bin/bash

# OpenBravo POS Build Script
# Builds the binary distribution compatible with Java 17

set -e  # Exit on error

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "========================================="
echo "  OpenBravo POS 2.30.2 - Build Script"
echo "========================================="
echo ""

# Check Java version
echo "🔍 Checking Java version..."
java -version 2>&1 | head -1
echo ""

# Clean previous build
echo "🧹 Cleaning previous build..."
rm -rf build/classes build/jar build/dist build/zip
echo "   ✓ Clean complete"
echo ""

# Compile and create JAR
echo "📦 Compiling POS application..."
ant jar
echo "   ✓ JAR created: build/jar/openbravopos.jar"
echo ""

# Create binary distribution
echo "📦 Creating binary distribution..."
ant dist.bin
echo "   ✓ Distribution created: build/dist/openbravopos_2.30.2_bin.zip"
echo ""

# Show results
echo "========================================="
echo "  Build Summary"
echo "========================================="
echo ""
echo "JAR file:"
ls -lh build/jar/openbravopos.jar | awk '{print "  " $9 " (" $5 ")"}'
echo ""
echo "Distribution ZIP:"
ls -lh build/dist/openbravopos_2.30.2_bin.zip | awk '{print "  " $9 " (" $5 ")"}'
echo ""
echo "✅ Build completed successfully!"
echo ""
echo "To test the application, run:"
echo "  ./start-fixed.sh"
echo ""
echo "To extract the distribution:"
echo "  unzip build/dist/openbravopos_2.30.2_bin.zip -d /path/to/destination"
echo ""
