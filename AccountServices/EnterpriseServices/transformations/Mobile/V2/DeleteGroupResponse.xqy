xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns3="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns1="http://www.tracfone.com/GroupManagementServices";
(:: import schema at "../../../../../GroupManagementServices/CoreServices/xsd/GroupManagementServices.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/dvm";
(:: import schema at "../../../../../TFCommon/xsd/dvm.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $deleteGroupResponse as element() (:: schema-element(ns1:deleteGroupResponse) ::) external;
declare variable $errorCodesMap as element() (:: schema-element(ns2:dvm) ::) external;

declare function local:DeleteGroupResponse($deleteGroupResponse as element() (:: schema-element(ns1:deleteGroupResponse) ::), 
                                                         $errorCodesMap as element() (:: schema-element(ns2:dvm) ::)) 
                                                         as element() (:: schema-element(ns3:deleteGroupResponse) ::) {
    <ns3:deleteGroupResponse>
          {
        	
			if(fn:data($deleteGroupResponse/com:result/com:code) ='0') then 
			<com:result>
                <com:code>{fn:data($deleteGroupResponse/com:result/com:code)}</com:code>
                <com:message>{fn:data($deleteGroupResponse/com:result/com:message)}</com:message>           
            </com:result>
			else if(fn:data($errorCodesMap/ns2:rows/ns2:row[ns2:cell[1]=fn:data($deleteGroupResponse/com:result/com:code)]/ns2:cell[2])) then 
			<com:result>
                <com:code>{fn:data($errorCodesMap/ns2:rows/ns2:row[ns2:cell[1]=fn:data($deleteGroupResponse/com:result/com:code)]/ns2:cell[2])}</com:code>
                <com:message>{fn:data($deleteGroupResponse/com:result/com:message)}</com:message>          
            </com:result>
			else
             <com:result>
                <com:code>999</com:code>
                <com:message>{fn:data($deleteGroupResponse/com:result/com:message)}</com:message>            
             </com:result>
		}
        <com:requestToken>
            <com:clientTransactionId>{fn:data($deleteGroupResponse/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($deleteGroupResponse/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
    </ns3:deleteGroupResponse>
};

local:DeleteGroupResponse($deleteGroupResponse, $errorCodesMap)