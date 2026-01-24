FROM eclipse-temurin:17-jdk-jammy

LABEL maintainer="alifs-dev"
LABEL description="Openbravo POS 2.30.2 - Java 17 compatible (2025)"

# Dépendances nécessaires à Swing + impression
RUN apt-get update && apt-get install -y \
    ant \
    unzip \
    fontconfig \
    libfreetype6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libxrandr2 \
    libxinerama1 \
    libxcursor1 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/openbravo

COPY . .

RUN chmod +x start.sh

# ✅ COMMANDE ANT CORRECTE (target par défaut)
RUN ant

CMD ["./start.sh"]
