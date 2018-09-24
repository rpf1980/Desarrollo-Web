<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/playlist">
  <!--Construimos el html-->
  <html>
  <!--Lincamos el archivo css-->
  <head><link rel="stylesheet" href="lista.css"/></head>
  <body>
    <h1><xsl:value-of select="title"/>, la lista musical de <xsl:value-of select="creator"/></h1>
    <p>Version de la playlist: <xsl:value-of select="@version"/></p>
    <!--Fecha-->
    <p>Fecha:<xsl:value-of select="date"/></p>
    
    <!--La tabla-->
    <table>
      <tr>
        <th>Artista</th>
        <th>Canción</th>
        <th>Duración</th>
        <th>Localización</th>
      </tr>
      
      <!--Bucle para mostrar una fila por cada track-->
      <xsl:for-each select="trackList/track">
        <xsl:sort select="duration" data-type="number" order="descending"/>
      
      <!--Condiciones con el choose-->
      <xsl:choose>
        <xsl:when test="duration &lt;100"><!--PRIMERA CONDICION-->
          <tr>
            <td><xsl:value-of select="creator"/></td>
            <td><xsl:value-of select="title"/></td>
            <td class="verde"><xsl:value-of select="duration"/></td>
            <td><a href="{location}"><xsl:value-of select="location"/></a></td>
          </tr>
        </xsl:when> 
        <xsl:when test="duration &gt;300"><!--SEGUNDA CONDICION-->
          <tr>
            <td><xsl:value-of select="creator"/></td>
            <td><xsl:value-of select="title"/></td>
            <td class="rojo"><xsl:value-of select="duration"/></td>
            <td><a href="{location}"><xsl:value-of select="location"/></a></td>
          </tr>
        </xsl:when>
      <xsl:otherwise>
        <tr>
            <td><xsl:value-of select="creator"/></td>
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="duration"/></td>
            <td><a href="{location}"><xsl:value-of select="location"/></a></td>
          </tr>  
      </xsl:otherwise>
      </xsl:choose>
      </xsl:for-each>
    </table>
  </body>
  </html>
  </xsl:template>
</xsl:stylesheet>
