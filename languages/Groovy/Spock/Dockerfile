FROM       cyberdojofoundation/groovy-2.4.4
MAINTAINER Jon Jagger <jon@jaggersoft.com>

ADD spock-core-1.0-groovy-2.4.jar /groovy/
RUN cp /groovy-2.4.4/embeddable/groovy-all-2.4.4.jar /groovy/
RUN cp /groovy-2.4.4/lib/hamcrest-core-1.3.jar /groovy/
RUN cp /groovy-2.4.4/lib/junit-4.12.jar /groovy/

ENV CLASSPATH=/groovy/

