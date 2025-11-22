FROM tomcat:9.0

ADD war/*.war /usr/local/tomcat/webapps/W25_22400191_1.war

CMD ["catalina.sh", "run"]