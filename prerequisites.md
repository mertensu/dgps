---
output:
  pdf_document: default
  html_document: default
---

# Einführung in das Bayessche Hypothesentesten und R

## Prerequisites

Liebe Teilnehmer(innen),

damit der Workshop reibungslos verlaufen kann, möchten wir Sie bitten, die folgenden Programme schon vorab auf Ihren Laptops zu installieren. Falls es bei einem der Schritte Probleme gibt, können Sie sich jederzeit gerne melden. Schreiben Sie eine kurze Mail an <a href= "mailto:ulf.mertens@psychologie.uni-heidelberg.de">ulf.mertens@psychologie.uni-heidelberg.de</a>

### 1. R und RStudio

Auch wenn Sie R bzw. RStudio eventuell schon installiert haben, bitten wir Sie sowohl R als auch RStudio auf die momentan aktuellste Version zu updaten. Die aktuelle R-Version ist **3.5.1**, die RStudio-Version ist Version **1.1.456**. Sie können überprüfen, welche Version von R derzeit auf Ihrem Rechner installiert ist, indem Sie `sessionInfo()` in die Konsole eingeben und mit Enter bestätigen. Um zu sehen welche RStudio-Version installiert ist, öffnen Sie RStudio und klicken auf _Help->About RStudio_.

#### Installation/Update von R

Unter dem folgenden Link können Sie die aktuelle Version von R installieren:


<a href="https://cran.r-project.org/"><span style="color:blue">https://cran.r-project.org/</span></a>


#### Installation/Update von RStudio

Scrollen Sie beim dem folgenden Link etwas nach unten und wählen Sie unter _Installers for Supported Platforms_ den passenden Download aus.

<a href="https://www.rstudio.com/products/rstudio/download/"><span style="color:blue">https://www.rstudio.com/products/rstudio/download/</span></a>



### 2. rstan/brms

#### 2.1 rstan

Das Package _rstan_ bzw. _brms_ bitten wir ebenfalls schon vorab zu installieren. Eine Beschreibung wie Sie _rstan_ (und für Windows _rtools_) installieren können für Ihr Betriebssystem finden Sie unter folgendem Link. Alle Windows-User bitte erst Schritt 2.2 anschauen, bevor Sie auf den Link klicken:

<a href="https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Windows"><span style="color:blue">https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Windows</span></a>

#### 2.2 rtools (nür für Windows)

Bitte beachten Sie bei der Installation von _rtools_ darauf, sowohl R, als auch g++ als Pfad hinzufügen wie in den folgenden Screenshots zu sehen. Bitte verändern Sie nicht den voreingestellten Speicherort von rtools. Kontrollieren Sie bitte auch, ob Sie an einem 32 oder 64bit Laptop arbeiten.
    
* Pfad für R:
    + für 32bit: `C:\Program Files\R\R-3.5.1\bin\i386`
    + für 64bit: `C:\Program Files\R\R-3.5.1\bin\x64`

* Pfad für g++:
    + für 32bit: `C:\Rtools\mingw_32\bin`
    + für 64bit: `C:\Rtools\mingw_64\bin`
  
  
<img src=img/rtools_choose.png width='300' height='250'>

<img src=img/rtools_check.png width='300' height='250'>

<img src=img/rtools_fill.png width='300' height='250'>


#### 2.3 Weitere Pakete

Sobald Sie _rstan_ installiert haben, installieren Sie bitte die untenstehenden Pakete mithilfe der folgenden Syntax.

```r
install.packages(c('Rcpp','tidyverse','brms','jmv','afex','emmeans','BayesFactor','HDInterval', 'broom','haven','ggmcmc'))
```

### 3. R-Notebook

Wir werden im Workshop mit dem R-Notebook arbeiten. Um das R-Notebook verwenden zu können, klicken Sie bitte in R-Studio auf File -> New File -> R Notebook. Sie werden bei erstmaliger Verwendung gebeten, einige Pakete zu installieren. Bitte bestätigen Sie die Installation. Nach erfolgreicher Installation sollten Sie ohne Probleme das R-Notebook öffnen können. 
