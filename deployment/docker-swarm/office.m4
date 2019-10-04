define(`SCENARIO_NAME',defn(`scenario'defn(`SCENARIOIDX')))dnl
define(`OFFICE_NAME',defn(`SCENARIO_NAME')`_office'defn(`OFFICEIDX'))dnl
define(`OFFICE_LOCATION',ifelse(index(defn(`SCENARIO'),defn(`SCENARIO_NAME')),-1,,`defn(defn(`OFFICE_NAME')_location)'))dnl
define(`CAMERA_NETWORK',192.168.eval(defn(`SCENARIOIDX')*defn(`NOFFICES')+defn(`OFFICEIDX')-1).0/24)dnl
define(`CAMERA_RTSP_PORT',17000)dnl
define(`CAMERA_RTP_PORT',27000)dnl
define(`CAMERA_PORT_STEP',50)dnl
define(`OFFICE_ZONE',node.ifelse(eval(defn(`NOFFICES')>1),1,`labels.office'defn(`OFFICEIDX')_zone==yes,role==manager))dnl
define(`STORAGE_ZONE',node.ifelse(eval(defn(`NOFFICES')>1),1,`labels.office'defn(`OFFICEIDX')_storage==yes,role==manager))dnl
