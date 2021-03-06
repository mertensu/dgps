######################################################################
### Workshop DGPs 2018                                             ###
### Teil II Kapitel 5 Grundlagen R f�r Bayessches Hypothesentesten ###                               
### Momme v. Sydow                                                 ###
###                                                                ###
### Die folgenden 10 Aufgaben erg�nzen die Pr�sentation            ###
######################################################################

  # Mit den Pfeilen links (bei den Zeilennummern) k�nnen Sie Rubriken aufklappen oder zuklappen.
  # Falls diese ge�ffnet sind, schlie�en sie bitte alle Rubriken unterhalb dieser Anleitung, 
  # um erstmal eine �bersicht zu gewinnen.
  # Falls Sie Aufgabe selbst l�sen wollen, sollten Sie nur die Instruktion am Anfang aufklappen,
  # nicht aber die L�sungen. Manche der Aufgaben sollten Sie versuchen selbst zu l�sen, bei anderen
  # sollten Sie sich direkt die L�sung ansehen und diese ab�ndern.
  #
  # Falls Sie noch Fehler im Code finden, lassen Sie es mich bitte wissen. 
  

  ### AUFGABE 0, Initialisierung und Hilfe ####
    #Mache dich w�hrend der anderen Aufgaben weiter mit den Befehlen vertraut. 
    #Nutze insbesondere help()

  #Workspace leeren #
    rm(list=ls())  #Clear Workspace - L�scht alle Objekte und Variablen im Arbeitsspeicher.                    

  # Hilfe #
    help()     #Infos zu Befehlen, auch in RStudio �ber Help, etwa: help(plot).
    example()  #Beispiele f�r Befehlsverwendung
    demo()     #Codebeispiele mit Grafiken f�r Grafikbefehle
    apropos()  #Funktionen, die einen String enthalten.

  ### AUFGABE 1, Rechnen (Pr�sentation Abschnitt 2.3): Binomialverteilung ####
    1*1  
    #Verwenden aritmetische Operationen
    #Um ein Ergebnis ausgeben zu lassen, verwende STRG+EINGABE (in alten Versionen STRG+R) hinter der Formel
    #==> Siehe Tabelle in Pr�sentation mit Operationen
    #Was ist der Binomialkoeffizient mit n = 5 und k = 3 g�nstigen F�llen?
    #Bestimme einzelne Werte aus der Binomialverteilung

    ### L�sung Aufgabe 1####
      n = 5
      k = 3
      p = .5
      choose(n,k) #Binomialkoeffizient
      choose(n,k)*p**k*(1-p)**(n-k) #Wert aus Binomialverteilung

  ### AUFGABE 2, Bayestheorem/Mammographieproblem ####
    #==> Siehe Aufgabenstellung in Pr�sentation
    ### L�sung Aufgabe 2 Schritt 1 Variablenkodierung ####
      #Prior Hypothese (Krankheit)
        Prior_K<- .01
        #PH<- .01
      #Likelihood: P(Daten|Hypothese), hier Sensitivit�t, P(Test pos | Krankheit) - Richtig-Positive Rate
        Like_T_K <- .80
        #LD_H<-.80
      #Likelihood Non-H: P(Daten|Non-Hypothese), falsch positiv; vgl. Spezifit�t war 1-P(D|NH) bzw. 1-P(Test pos|NH) - richtig Negativ Rate
        Like_T_NK <- .15
        #LD_NH <- .15
    ### L�sung Aufgabe 2 Schritt 2 Bayestheorem ####
      #Posterior Hypothese nach positivem Test
        (Poster_K_T <-Like_T_K*Prior_K/(Like_T_K*Prior_K+Like_T_NK*(1-Prior_K)))  
        #(PH_D <- (LD_H*PH)/ (LD_H*PH+LD_NH*(1-PH)))
  ### AUFGABE 3, Fortsetzung Mammographieproblem - Vektoren ####
    #==> Siehe Aufgabenstellung in Pr�sentation
    #    Berechne den Posterior (s.o.) nun f�r verschiedene Priori-Wahrscheinlichkeiten und 
    #    einen Vektor Priori Verteilungen.
    #    Variiere die Aufl�sung der Prior-Stufen
    ### L�sung Aufgabe 3 ####
      #Alles gleich wie in Aufgabe 2, nur die Priors nicht. Im dritten Fall haben wir einen Vektor
      #Prior Hypothese (Krankheit)
        Prior_K<- .01
        Prior_K<- .3
        (Prior_K<- seq(from=.5, to=.01, by=-0.01))
      #Likelihood: P(Daten|Hypothese), hier Sensitivit�t, P(Test pos | Krankheit) - Richtig-Positive Rate
        Like_T_K <- .80
        #LD_H<-.80
      #Likelihood Non-H: P(Daten|Non-Hypothese), falsch positiv; vgl. Spezifit�t war 1-P(D|NH) bzw. 1-P(Test pos|NH) - richtig Negativ Rate
        Like_T_NK <- .15
      #Bayestheorem Posterior Hypothese nach positivem Test
        (Poster_K_T <-Like_T_K*Prior_K/(Like_T_K*Prior_K+Like_T_NK*(1-Prior_K)))  
        #Wenn man mit Prior-Vektor beginnt, erh�lt man Posterior-Vektor

  ### AUFGABE 4, Fortsetzung Mammographieproblem - Plot ####
    #==> Siehe Aufgabenstellung in Pr�sentation
    #    Plotte in Fortsetzung von Aufgabe 3 Posteriorvektor 
    ### L�sung Aufgabe 4 (Fortsetzung 3) ####
      #Ver�ndere Druckparameter
      #Aufgabenl�sung 4 
      plot(
        Prior_K,
        Poster_K_T, 
        main="Posterior Krankheitstest",
        xlab="Prior",
        ylab="Posterior",
        col="red",     
        type="p"
      )
  ### AUFGABE 5, Fortsetzung Mammographieproblem - Linien in Schleife produzieren ####
    #==> Siehe Aufgabenstellung in Pr�sentation
    #Nimm das Mamographieproblem von Aufgabe 3/4 und l�se es f�r verschiedene Likelihoods 
    #mit Hilfe einer Schleife. Plotte mit points verschiedene Linien.  
    ### L�sung Aufgabe 5  ####
        
      #Vorweg: Mehrere Linien drucken (erste mit plot, folgende mit points)
        x<-seq(from=-5,to=5, length.out=1000) #x-Werte
        plot(x,x**2, col="blue", type="l", ylim=c(-10,+20))
        points(x,x**3+2, col="red", type="l")

      #Mammographie (Wiederholung)
        #Eingabe Priorvektor
          Prior_K<- seq(from=.5, to=.0001, by=-0.0001)
        #Leere Grafik
          plot(x=c(0,.5), y=c(0,1), type = "n",   xlab="Prior", ylab="Posterior", main="Posterior Krankheitstest")
        #Schleife in der Likelihoods variiert werden
          for(i in seq(.6, .99, .01)){
            #Likelihood: P(Daten|Hypothese), hier Sensitivit�t, P(Test pos | Krankheit) - Richtig-Positive Rate
              Like_T_K <- i; 
            #Likelihood Non-H: P(Daten|Non-Hypothese), falsch positiv; vgl. Spezifit�t war 1-P(D|NH) bzw. 1-P(Test pos|NH) - richtig Negativ Rate
              Like_T_NK <- 1-Like_T_K
            #Posterior Hypothese nach positivem Test
              Poster_K_T <-Like_T_K*Prior_K/(Like_T_K*Prior_K+Like_T_NK*(1-Prior_K))  
            #Plot erst leere Grafik, dann Punkte
              linies(Prior_K, Poster_K_T, col="red")
          }

  ### AUFGABE 6, Pascalsches Dreieck - Linien in Schleife produzieren ####
    #Wir erinnern uns an n �ber k (und hier geben wir k von 0 bis 10 an.)
      choose(10, 0:10)    
    #Drucke einige Linien aus dem Pascalschen Dreieick
    ### L�sung Aufgabe 6  ####
      #Leere Grafik
        plot(x=c(1,10), y=c(0,260), type = "n", xlab="x", ylab="y", main="Pascalsches Dreieck")
      #Linien und Punkte hinzuf�gen
        for(n in 0:10) {
            lines(choose(n, 0:n), col=n)
            points(choose(n, 0:n), col=n, pch=16)
          }
          

  ### AUFGABE 7, Normalverteilung ####  
    #Spiele mit Normalverteilung
      help(rnorm)
    #L�sung Aufgabe 7####
    #7.1 Typen von Verteilungsausgabewerten hier bei der Normalverteilung
      plot(rnorm(n=1000, mean=0, sd=1))           #rnorm
      qnorm(p=.95, mean=0, sd=1)                  #qnorm
      plot(dnorm(seq(-3,3,.1), mean = 0, sd = 1)) #dnorm
      plot(pnorm(seq(-3,3,.1), mean = 0, sd = 1)) #pnorm
      
    #7.2 Univariate Normalverteilung
      #7.2.1 Dichte der Standard-Normalverteilung
        x<-seq(-3,3,0.1)
        y<-dnorm(x)
        plot(x,y,type="l", 
           main=expression(paste("Standard-Normalverteilung")),
           ylim=c(0,.8), 
           ylab="Wahrscheinlichkeitsdichte",
           xlab=expression(paste("z"))
        )
      
      #7.2.2  Histogramm 
        plot(rnorm(1000))
        plot(rnorm(1000)*rnorm(1000))
        hist(rnorm(1000))
        hist(rnorm(1000)*rnorm(1000))
        var1 <- rnorm(1000)
        plot(var1)
    
      #7.2.3 Visualisierung Abweichung  Sample von einer Standard-NV
        hist(rnorm(1000), freq=FALSE, breaks=20)  #Histogramm
        curve(dnorm(x,mean=0,sd=1),col="red",add=TRUE) #Kurve
        mean(var1)
        
  ### AUFGABE 8, Abweichung Mittelwert in Normalverteilung (Schleife) ####
    #Rechnerische Abweichung Mean(Sample)-Mean(StandardNV) in Schleife
    ### L�sung Aufgabe 8 ####
    #Anmerkung: Sch�ner und schneller als Schleifen sind oft Vektoroperationen. Aber hier reicht erstmal eine �bersichtlichere Schleife.
    Stichprobenzahl<-1
    Stichprobengr��emax <- 80
    Vektor_mean_means <- numeric(0) #Zur�cksetzen leere numerische Variable
    for(Stichprobengr��e in 1:Stichprobengr��emax){
      Vektor_means <- numeric(0) #Zur�cksetzen leere numerische Variable
      for(n in 1:Stichprobenzahl){
        Vektor_means <- c(Vektor_means, abs(mean(rnorm(Stichprobengr��e))))
      }
      Vektor_mean_means<-c(Vektor_mean_means, mean(Vektor_means))
    }
    Vektor_means
    mean(Vektor_means)
    plot(Vektor_mean_means, ylim=c(0, max(Vektor_mean_means)), xlab="Stichprobengr��e", ylab="Abs. Diff. wahrer Mittelwert",
       main=paste("Gr��e Stichpr. = ", Stichprobengr��emax, ", Zahl Stichpr. = ", Stichprobenzahl))
  
#3.4 Bivariate NVs
  #Schlichte Bivariate
    plot(rnorm(1000), rnorm(1000))
  #Mehrere �bereinander mit Points
    n<-1000
    var1 <- rnorm(n)
    var2 <- rnorm(n)
    var3 <- (rnorm(n) + rnorm(n))/2
    var4 <- (rnorm(n)+rnorm(n)+rnorm(n)+rnorm(n)+rnorm(n)+rnorm(n))/6
    hist(var1, col="gray")
    hist(var4, add=TRUE, col="violet") #Auch mehrere Histogramme k�nnen in eine Grafik gedruckt werden 
    plot(var1,var2, ylab="var2, var3, var4")
    points(var1, var3, col="red")
    points(var1, var4, col="violet")
    
    
    
  ### AUFGABE 9, Binomiales Updaten mit konjugierter Beta-Verteilung ####
    #Wie in Kapitel 3 dargelegt, geht es hier um ein Updaten ohne Integration nur aufgrund der Addition der a-, b-, k- und nk-Werte        
    ### L�sung Aufgabe 9 ####
    #Grafikparameter: Wieviele Grafiken?
      par(mfrow = c(1, 1)) #Grafikenanordnung: Zeilen, Spalten  
      par(mfrow = c(3, 1)) #Drei Grafiken untereinander, Prior, Likelihood, Posterior 
    
    #Eingabe Parameter 
      #Aufl�sung von theta (0 bis 1)
        p<-seq(from=0,to=1,by=0.001)  # Aufl�sung der Wahrscheinlichkeit = 1001 F�lle, generative Wahrscheinlichkeiten bei der Berechnung der Priors/Likelihoods/Posteriors.
      #Beta-Prior (Eingabe)
        a <- 1   #Alpha-Parameterder Beta-Verteilung
        b <- 19    #Beta-Parameter der Beta-verteilung 
      #Daten (Eingabe)
        k <- 6
        nk <- 4   #non-k oder n-k
    #Plots
      #Prior
        #plot(theta,dbeta(p, shape1=a, shape2=b),type="l")  #Type="1" macht aus Punkten Linien
        plot(p,dbeta(p, shape1=a, shape2=b),type="l", xlab=bquote(paste(theta)), ylab=bquote(paste(italic("P"),"(", theta, ")")),  
          main = bquote(paste("Prior: ", "Beta(", .(a), ",", .(b), "), ", italic(M), " = ", .(round(mean(p*dbeta(p,shape1=a, shape2=b)), 2)), sep="")))  #Type="1" macht aus Punkten Linien
      #Likelihood
        plot(p, dbinom(x=k, size=k+nk, prob=p), type="l",   xlab=bquote(paste(theta)), ylab=bquote(paste(italic("L"), "(", italic(D), "|", theta, ")")), 
           main = bquote(paste("Likelihood: ", "Bin(", italic("k"), " = ", .(k), ", non-", italic("k"), "= ", .(nk), "), ", italic("M"), " = ", .(round(mean(p*dbinom(x=k, size=k+nk, prob=p)/(sum(dbinom(x=k, size=k+nk, prob=p))/length(p))), 2)), sep="")))
      #Posterior
        plot(p,dbeta(p, shape1=a+k, shape2=b+nk),type="l", xlab=bquote(paste(theta)), ylab=bquote(paste(italic("P"),"(", theta, "|", italic("D"),")")),  
           main = bquote(paste("Posterior: ", "Beta(", .(a+k), ",", .(b+nk), "), ", italic("M"), " = ", .(round(mean(p*dbeta(p,shape1=a+k, shape2=b+nk)), 2)), sep="")))  #Type="1" macht aus Punkten Linien
      #Hilfe
        help(dbeta)
        
  ### AUFGABE 10, Bayesfaktoren f�r den Binomialen Fall (vgl. Kapitel 4)####
    #Im folgenden k�nnen Sie unter "Parameter" f�r die Priorverteilungen  von H1 und H2 jeweils a und b (f�r B(a,b)) 
    #eingeben und auch die Daten: die beobachteten dichotomen H�ufigkeiten k, non-k (Kopf/Zahl). 
    #Sie k�nnen eine Null-Punkthypothese gegen eine Verteilungshypothese (etwa eine flache B(1,1) Verteilung)
    #testen. Dies w�re der Standardfall. In der L�sung kann man sowohl H1 und auch H2 als eine Punkthypothese, oder auch als 
    #Verteilungshypothese spezifizieren. Sie m�ssen dann unten aber auch dementsprechend den jeweiligen Code verwenden/aktivieren.
    #F�r beide Hs bestimmen Sie die marginalen Likelihood (Punktwert), P(D|M)=Integral(P(D|theta)P(theta|M))dtheta.        
    #Graphisch wird zus�tzlich P(D|theta) darstellen, was hier f�r beide Modelle gleich ist.    
    #Siehe ausf�hrlicher hierzu Kapitel 4 (4.4).
    ### L�sung Aufgabe 10 ####
      ###Parameter####
      #Daten
        k = 6   #k (g�nstige F�lle, etwa "Kopf", bei Stichprobengr��e n=k+nk )
        nk = 4  #Non-k (etwa "Zahl")
      #Punkthypothesen
        p1 =.6     #H1
        #p2 =.6    #H2
      #Verteilungshypothesen
          N = 1000 #Zahl der Durchl�ufe
        #Betaverteilung H1
          #a1 = 1
          #b1 = 1
        #Betaverteilung H2
          a2 = 1
          b2 = 1

          
    #P(D|theta)  (ohne P(theta|M))
        plot(p, dbinom(x=k, size=k+nk, prob=p), type="l",   xlab=bquote(paste(theta)), ylab=bquote(paste(italic("L"), "(", italic(D), "|", theta, ")")), 
            main = bquote(paste("Likelihood: ", "Bin(", italic("k"), " = ", .(k), ", non-", italic("k"), "= ", .(nk), "), ", italic("M"), " = ", .(round(mean(p*dbinom(x=k, size=k+nk, prob=p)/(sum(dbinom(x=k, size=k+nk, prob=p))/length(p))), 2)), sep="")))
          
      ### Marginal Likelihood H1 ####
        
      #Variante Punkthypothese f�r H1 (etwa Nullhypothese)
        (MargLike_H1<-dbinom(x=k, size=k+nk, p=p1))
          #points(.5, MargLike_H1, pch=16)
        
      #Variante Verteilung f�r H1 
        #ModelLike_H1_V<- numeric() #Leeren numerischen Vektor (sonst werden alte Daten miteinbezogen)
        #for(i in 1:N){
        #  theta = rbeta(n = 1, a1, b1)
        #  ModelLike_H1_V = c(ModelLike_H1_V, dbinom(x=k, size=k+nk, p=theta)) #schneller w�re nicht alles zu speichern, sondern direkt die Summe zu nehmen und die am Ende durch N zu teilen.  
        #}
        #(MargLike_H1<-mean(ModelLike_H1_V))
      ### Marginal Likelihood H2 ####
        #Variante Punkthypothese (etwa Nullhypothese)
          #(MargLike_H2<-dbinom(x=k, size=k+nk, p=p2))
        #Variante Verteilung 
          ModelLike_H2_V <- numeric() #Leeren numerischen Vektor
          for(i in 1:N){
            theta = rbeta(n = 1, a2, b2)
            ModelLike_H2_V = c(ModelLike_H2_V, dbinom(x=k, size=k+nk, p=theta))
          }
          (MargLike_H2<-mean(ModelLike_H2_V))
    ### Bayesfaktor ###
      (BF12=MargLike_H1/MargLike_H2)
      (BF21=MargLike_H2/MargLike_H1)
        
        
                
          
          
          