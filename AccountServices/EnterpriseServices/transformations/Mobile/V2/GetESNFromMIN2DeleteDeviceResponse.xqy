xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns3="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns1="http://www.tracfone.com/PhoneCoreServices";
(:: import schema at "../../../../../PhoneServices/CoreServices/xsd/PhoneCoreServices.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/dvm";
(:: import schema at "../../../../../TFCommon/xsd/dvm.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $getESNFromMINResponse as element() (:: schema-element(ns1:getESNFromMINResponse) ::) external;
declare variable $errorCodesMap as element() (:: schema-element(ns2:dvm) ::) external;

declare function local:GetESNFromMIN2DeleteDeviceResponse($getESNFromMINResponse as element() (:: schema-element(ns1:getESNFromMINResponse) ::), 
                                                          $errorCodesMap as element() (:: schema-element(ns2:dvm) ::)) 
                                                          as element() (:: schema-element(ns3:deleteDeviceResponse) ::) {
    <ns3:deleteDeviceResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($getESNFromMINResponse/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($getESNFromMINResponse/com:requestToken/com:clientId)}</com:clientId>
            
        </com:requestToken>
             {
			            	if(fn:exists($errorCodesMap/ns2:rows/ns2:row[ns2:cell[1]/text()=$getESNFromMINResponse/com:result/com:code/text()]/ns2:cell[2]/text()) = xs:boolean("false"))then
			                <com:result>
			                    <com:code>{ data($getESNFromMINResponse/com:result/com:code) }</com:code>
			                    <com:message>{ data($getESNFromMINResponse/com:result/com:message) }</com:message>
			                </com:result>
			    			else
			    			<com:result>
			                    <com:code>{ $errorCodesMap/ns2:rows/ns2:row[ns2:cell[1]/text()=$getESNFromMINResponse/com:result/com:code/text()]/ns2:cell[2]/text()}</com:code>
			                    <com:message>{ $errorCodesMap/ns2:rows/ns2:row[ns2:cell[1]/text()=$getESNFromMINResponse/com:result/com:code/text()]/ns2:cell[3]/text()}</com:message>
			    			</com:result>
		}
		
    </ns3:deleteDeviceResponse>
};

local:GetESNFromMIN2DeleteDeviceResponse($getESNFromMINResponse, $errorCodesMap)
