######################################################################
### Workshop DGPs 2018, Heidelberg                                 ###
### Teil II Kapitel 1 Grundlagen R für Bayessches Hypothesentesten ###                               ###
###                                                                ###
### Die folgenden 10 Aufgaben ergänzen die Präsentation            ###                                        ###
######################################################################

  # Mit den Pfeilen Links können Sie die Rubriken aufklappen.
  # Falls Sie die Aufgabe selbst lösen wollen, nur die Instruktion am Anfang aufklappen.
  # nicht die Lösungen. 

  ### AUFGABE 0, Initialisierung und Hilfe ####

  #Workspace leeren #
    rm(list=ls())  #Clear Workspace                     

  # Hilfe #
    help()     #Infos zu Befehlen, auch in RStudio über Help
    example()  #Beispiele für Befehlsverwendung
    demo()     #Codebeispiele mit Grafikenfür Grafikbefehle
    apropos()  #Funktionen die einen String enthalten.



  ### AUFGABE 1, Rechnen (Präsentation Abschnitt 2.3): Binomialverteilung ####
    1*1  
    #Verwenden aritmetische Operationen
    #Um ein Ergebnis ausgeben zu lassen, verwende STRG+EINGABE (in alten Versionen STRG+R) hinter der Formel
    #==> Siehe Tabelle in Präsentation mit Operationen
    #Was ist der Binomialkoeffizient mit n = 5 und k = 3 günstigen Fällen?
    #Bestimme einzelne Werte aus der Binomialverteilung

    ### Lösung Aufgabe 1####
      n = 5
      k = 3
      p = .5
      choose(n,k) #Binomialkoeffizient
      choose(n,k)*p**k*(1-p)**(n-k) #Wert aus Binomialverteilung

  ### AUFGABE 2, Bayestheorem/Mammographieproblem ####
    #==> Siehe Aufgabenstellung in Präsentation
    ### Lösung Aufgabe 2 Schritt 1 Variablenkodierung ####
      #Prior Hypothese (Krankheit)
        Prior_K<- .01
        #PH<- .01
      #Likelihood: P(Daten|Hypothese), hier Sensitivität, P(Test pos | Krankheit) - Richtig-Positive Rate
        Like_T_K <- .80
        #LD_H<-.80
      #Likelihood Non-H: P(Daten|Non-Hypothese), falsch positiv; vgl. Spezifität war 1-P(D|NH) bzw. 1-P(Test pos|NH) - richtig Negativ Rate
        Like_T_NK <- .15
        #LD_NH <- .15
    ### Lösung Aufgabe 2 Schritt 2 Bayestheorem ####
      #Posterior Hypothese nach positivem Test
        (Poster_K_T <-Like_T_K*Prior_K/(Like_T_K*Prior_K+Like_T_NK*(1-Prior_K)))  
        #(PH_D <- (LD_H*PH)/ (LD_H*PH+LD_NH*(1-PH)))
  ### AUFGABE 3, Fortsetzung Mammographieproblem - Vektoren ####
    #==> Siehe Aufgabenstellung in Präsentation
    #    Berechne den Posterior (s.o.) nun für verschiedene Priori-Wahrscheinlichkeiten und 
    #    einen Vektor Priori Verteilungen.
    #    Variere die Auflösung der Prior-Stufen
    ### Lösung Aufgabe 3 ####
      #Alles gleich wie in Aufgabe 2, nur die Priors nicht. Im dritten Fall haben wir einen Vektor
      #Prior Hypothese (Krankheit)
        Prior_K<- .01
        Prior_K<- .3
        (Prior_K<- seq(from=.5, to=.01, by=-0.01))
      #Likelihood: P(Daten|Hypothese), hier Sensitivität, P(Test pos | Krankheit) - Richtig-Positive Rate
        Like_T_K <- .80
        #LD_H<-.80
      #Likelihood Non-H: P(Daten|Non-Hypothese), falsch positiv; vgl. Spezifität war 1-P(D|NH) bzw. 1-P(Test pos|NH) - richtig Negativ Rate
        Like_T_NK <- .15
      #Bayestheorem Posterior Hypothese nach positivem Test
        (Poster_K_T <-Like_T_K*Prior_K/(Like_T_K*Prior_K+Like_T_NK*(1-Prior_K)))  
        #Wenn man mit Prior-Vektor beginnt, erhält man Posterior-Vektor

  ### AUFGABE 4, Fortsetzung Mammographieproblem - Plot ####
    #==> Siehe Aufgabenstellung in Präsentation
    #    Plotte in Fortsetzung von Aufgabe 3 Posteriorvektor 
    ### Lösung Aufgabe 4 (Fortsetzung 3) ####
      #Verändere Druckparameter
      #Aufgabenlösung 4 
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
    #==> Siehe Aufgabenstellung in Präsentation
    #Nimm das Mamographieproblem von Aufgabe 3/4 und löse es für verschiedene Likelihoods 
    #mit Hilfe einer Schleife. Plotte mit points verschiedene Linien.  
    ### Lösung Aufgabe 5  ####
        
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
            #Likelihood: P(Daten|Hypothese), hier Sensitivität, P(Test pos | Krankheit) - Richtig-Positive Rate
              Like_T_K <- i; 
            #Likelihood Non-H: P(Daten|Non-Hypothese), falsch positiv; vgl. Spezifität war 1-P(D|NH) bzw. 1-P(Test pos|NH) - richtig Negativ Rate
              Like_T_NK <- 1-Like_T_K
            #Posterior Hypothese nach positivem Test
              Poster_K_T <-Like_T_K*Prior_K/(Like_T_K*Prior_K+Like_T_NK*(1-Prior_K))  
            #Plot erst leere Grafik, dann Punkte
              linies(Prior_K, Poster_K_T, col="red")
          }

  ### AUFGABE 6, Pascalsches Dreieck - Linien in Schleife produzieren ####
    #Wir erinnern uns an n über k (und hier geben wir k von 0 bis 10 an.)
      choose(10, 0:10)    
    #Drucke einige Linien aus dem Paskalschen Dreieick
    ### Lösung Aufgabe 6  ####
      #Leere Grafik
        plot(x=c(1,10), y=c(0,260), type = "n", xlab="x", ylab="y", main="Pascalsches Dreieck")
      #Linien und Punkte hinzufügen
        for(n in 0:10) {
            lines(choose(n, 0:n), col=n)
            points(choose(n, 0:n), col=n, pch=16)
          }
          

  ### AUFGABE 7, Normalverteilung ####  
    #Spiele mit Normalverteilung
    help(rnorm)
    #7,1 Typen von Verteilungsausgabewerten hier bei der Normalverteilung
      plot(rnorm(n=1000, mean=0, sd=1))
      qnorm(p=.95, mean=0, sd=1)
      plot(dnorm(seq(-3,3,.1), mean = 0, sd = 1))
      plot(pnorm(seq(-3,3,.1), mean = 0, sd = 1))
  
    #7.2 Univariate Normalverteilung
      #7.2.1  Histogramm 
        plot(rnorm(1000))
        plot(rnorm(1000)*rnorm(1000))
        hist(rnorm(1000))
        hist(rnorm(1000)*rnorm(1000))
        var1 <- rnorm(1000)
        plot(var1)
    
      #7.2.2 Visualisierung Abweichung  Sample von einer Standard-NV
        hist(rnorm(1000), freq=FALSE, breaks=20)  #Histogramm
        curve(dnorm(x,mean=0,sd=1),col="red",add=TRUE) #Kurve
        mean(var1)
        
  ### AUFGABE 8, Abweichung Mittelwert in Normalverteilung (Schleife) ####
    #Rechnerische Abweichung Mean(Sample)-Mean(StandardNV) in Schleife
    ### Lösung Aufgabe 8 ####
    #Anmerkung: Schöner und schneller als Schleifen sind of Vektoroperationen. Aber hier reicht erstmal eine übersichtlichere Schleife.
    Stichprobenzahl<-1
    Stichprobengrößemax <- 80
    Vektor_mean_means <- numeric(0) #Zurücksetzen leere numerische Variable
    for(Stichprobengröße in 1:Stichprobengrößemax){
      Vektor_means <- numeric(0) #Zurücksetzen leere numerische Variable
      for(n in 1:Stichprobenzahl){
        Vektor_means <- c(Vektor_means, abs(mean(rnorm(Stichprobengröße))))
      }
      Vektor_mean_means<-c(Vektor_mean_means, mean(Vektor_means))
    }
    Vektor_means
    mean(Vektor_means)
    plot(Vektor_mean_means, ylim=c(0, max(Vektor_mean_means)), xlab="Stichprobengröße", ylab="Abs. Diff. wahrer Mittelwert",
       main=paste("Größe Stichpr. = ", Stichprobengrößemax, ", Zahl Stichpr. = ", Stichprobenzahl))
  
#3.4 Bivariate NVs
  #Schlichte Bivariate
    plot(rnorm(1000), rnorm(1000))
  #Mehrere übereinander mit Points
    n<-1000
    var1 <- rnorm(n)
    var2 <- rnorm(n)
    var3 <- (rnorm(n) + rnorm(n))/2
    var4 <- (rnorm(n)+rnorm(n)+rnorm(n)+rnorm(n)+rnorm(n)+rnorm(n))/6
    hist(var1, col="gray")
    hist(var4, add=TRUE, col="violet") #Auch mehrere Histogramme können in eine Grafik gedruckt werden 
    plot(var1,var2, ylab="var2, var3, var4")
    points(var1, var3, col="red")
    points(var1, var4, col="violet")
    
    
    
  ### AUFGABE 9, Binomiales Updaten mit konjugierter Beta-Verteilung ####
    #Grafikparameter: Wieviele Grafiken
      par(mfrow = c(1, 1)) #Grafikenanordnung: Zeilen, Spalten  
      #par(mfrow = c(3, 1)) #Grafikenanordnung: Zeilen, Spalten  
    
    #Eingabe Parameter 
      #Auflösung von theta (0 bis 1)
        p<-seq(from=0,to=1,by=0.001)  # Auflösung der Wahrscheinlichkeit = 1001 Fälle, generative Wahrscheinlichkeiten bei der berechung der Priors/Likelihoods/Posteriors.
      #Beta-Prior (Eingabe)
        a <- 19   #Alpha-Parameterder Beta-Verteilung
        b <- 1    #Beta-Parameter der Beta-verteilung 
      #Daten (Eingabe)
        k <- 6
        nk <- 4   #non-k oder n-k
      #Plots
        #Prior
          #plot(theta,dbeta(p, shape1=a, shape2=b),type="l")  #Type="1" macht aus Punkten Linien
        plot(theta,dbeta(p, shape1=a, shape2=b),type="l", xlab=bquote(paste(theta)), ylab=bquote(paste(italic("P"),"(", theta, ")")),  
          main = bquote(paste("Prior: ", "Beta(", .(a), ",", .(b), "), ", italic(M), " = ", .(round(mean(p*dbeta(p,shape1=a, shape2=b)), 2)), sep="")))  #Type="1" macht aus Punkten Linien
        #Likelihood
          plot(p, dbinom(x=k, size=k+nk, prob=p), type="l",   xlab=bquote(paste(theta)), ylab=bquote(paste(italic("L"), "(", italic(D), "|", theta, ")")), 
           main = bquote(paste("Likelihood: ", "Bin(", italic("k"), " = ", .(k), ", non-", italic("k"), "= ", .(nk), "), ", italic("M"), " = ", .(round(mean(p*dbinom(x=k, size=k+nk, prob=p)/(sum(dbinom(x=k, size=k+nk, prob=p))/length(p))), 2)), sep="")))
        #Posterior
          plot(p,dbeta(p, shape1=a+k, shape2=b+nk),type="l", xlab=bquote(paste(theta)), ylab=bquote(paste(italic("P"),"(", theta, "|", italic("D"),")")),  
           main = bquote(paste("Posterior: ", "Beta(", .(a+k), ",", .(b+nk), "), ", italic("M"), " = ", .(round(mean(p*dbeta(p,shape1=a+k, shape2=b+nk)), 2)), sep="")))  #Type="1" macht aus Punkten Linien
    
  ### AUFGABE 10, Bayesfaktoren ####
    ###Parameter####
      #Daten
        k = 9
        n = 10
      #Punkthypothesen
        p1 =.5
        #p2 =.6
      #Verteilungen
          N = 1000 #Zahl der Durchläufe
        #Betaverteilung H1
          a1 = 1
          b1 = 1
        #Betaverteilung H2
          a2 = 1
          b2 = 1
    
    ### Marginal Likelihood H1 ####
        
      #Variante Punkthypothese (etwa Nullhypothese)
        (MargLike_H1<-dbinom(x=k, size=n, p=p1))
          #points(.5, MargLike_H1, pch=16)
        
      #Variante Verteilung 
        ModelLike_H1_V<- numeric() #Leeren numerischen Vektor (sonst werden alte Daten miteinbezogen)
        for(i in 1:N){
          theta = rbeta(n = 1, a1, b1)
          ModelLike_H1_V = c(ModelLike_H1_V, dbinom(x=k, size=n, p=theta)) #schneller wäre nicht alles zu speichern, sondern direkt die Summe zu nehmen und die am Ende durch N zu teilen.  
        }
        (MargLike_H1<-mean(ModelLike_H1_V))
    ### Marginal Likelihood H2 ####
        #Variante Punkthypothese (etwa Nullhypothese)
          #(MargLike_H2<-dbinom(x=6, size=10, p=.6))
        #Variante Verteilung 
          ModelLike_H2_V <- numeric() #Leeren numerischen Vektor
          for(i in 1:N){
            theta = rbeta(n = 1, a2, b2)
            ModelLike_H2_V = c(ModelLike_H2_V, dbinom(x=k, size=n, p=theta))
          }
          (MargLike_H2<-mean(ModelLike_H2_V))
    ### Bayesfaktor ###
      (BF12=MargLike_H1/MargLike_H2)
      (BF21=MargLike_H2/MargLike_H1)
        
        
                
          
          
          