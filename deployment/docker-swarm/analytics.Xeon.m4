
ifelse(defn(`SCENARIO_NAME'),`traffic',`
    defn(`OFFICE_NAME')_analytics_traffic:
        `image: smtc_analytics_object_xeon_'defn(`FRAMEWORK'):latest
        environment:
            OFFICE: "defn(`OFFICE_LOCATION')"
            DBHOST: "http://ifelse(eval(defn(`NOFFICES')>1),1,defn(`OFFICE_NAME')_db,db):9200"
            MQTTHOST: "defn(`OFFICE_NAME')_mqtt"
            STHOST: "http://defn(`OFFICE_NAME')_storage:8080/api/upload"
            EVERY_NTH_FRAME: 6
            `SCENARIO': "defn(`SCENARIO')"
            NO_PROXY: "*"
            no_proxy: "*"
        volumes:
            - /etc/localtime:/etc/localtime:ro
        networks:
            - appnet
        deploy:
            replicas: defn(`NANALYTICS')
            placement:
                constraints:
                    - node.labels.vcac_zone!=yes
')

ifelse(defn(`SCENARIO_NAME'),`stadium',`
    defn(`OFFICE_NAME')_analytics_entrance:
        `image: smtc_analytics_entrance_xeon_'defn(`FRAMEWORK'):latest
        environment:
            OFFICE: "defn(`OFFICE_LOCATION')"
            DBHOST: "http://ifelse(eval(defn(`NOFFICES')>1),1,defn(`OFFICE_NAME')_db,db):9200"
            MQTTHOST: "defn(`OFFICE_NAME')_mqtt"
            STHOST: "http://defn(`OFFICE_NAME')_storage:8080/api/upload"
            EVERY_NTH_FRAME: 6
            `SCENARIO': "defn(`SCENARIO')"
            NO_PROXY: "*"
            no_proxy: "*"
        volumes:
            - /etc/localtime:/etc/localtime:ro
        networks:
            - appnet
        deploy:
            replicas: defn(`NANALYTICS')
            placement:
                constraints:
                    - node.labels.vcac_zone != yes

    defn(`OFFICE_NAME')_analytics_crowd:
        `image: smtc_analytics_crowd_xeon_'defn(`FRAMEWORK'):latest
        environment:
            OFFICE: "defn(`OFFICE_LOCATION')"
            DBHOST: "http://ifelse(eval(defn(`NOFFICES')>1),1,defn(`OFFICE_NAME')_db,db):9200"
            MQTTHOST: "defn(`OFFICE_NAME')_mqtt"
            STHOST: "http://defn(`OFFICE_NAME')_storage:8080/api/upload"
            EVERY_NTH_FRAME: 30
            `SCENARIO': "defn(`SCENARIO')"
            NO_PROXY: "*"
            no_proxy: "*"
        volumes:
            - /etc/localtime:/etc/localtime:ro
        networks:
            - appnet
        deploy:
            replicas: defn(`NANALYTICS2')
            placement:
                constraints:
                    - node.labels.vcac_zone!=yes
                    
    defn(`OFFICE_NAME')_analytics_svcq:
        `image: smtc_analytics_object_xeon_'defn(`FRAMEWORK'):latest
        environment:
            OFFICE: "defn(`OFFICE_LOCATION')"
            DBHOST: "http://ifelse(eval(defn(`NOFFICES')>1),1,defn(`OFFICE_NAME')_db,db):9200"
            MQTTHOST: "defn(`OFFICE_NAME')_mqtt"
            STHOST: "http://defn(`OFFICE_NAME')_storage:8080/api/upload"
            EVERY_NTH_FRAME: 6
            `SCENARIO': "defn(`SCENARIO')"
            NO_PROXY: "*"
            no_proxy: "*"
        volumes:
            - /etc/localtime:/etc/localtime:ro
        networks:
            - appnet
        deploy:
            replicas: defn(`NANALYTICS3')
            placement:
                constraints:
                    - node.labels.vcac_zone!=yes
')
