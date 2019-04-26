xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns1="http://www.tracfone.com/AccountCoreServices";
(:: import schema at "../../../../CoreServices/xsd/AccountCoreServices.xsd" ::)
declare namespace ns3="http://xmlns.oracle.com/dvm";
(:: import schema at "../../../../../TFCommon/xsd/dvm.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $removeMultipleEsnToAccountResponse as element() (:: schema-element(ns1:removeMultipleEsnToAccountResponse) ::) external;
declare variable $errorCodesMap as element() (:: schema-element(ns3:dvm) ::) external;

declare function local:RemoveEsnFromAccount2DeleteDeviceResponse($removeMultipleEsnToAccountResponse as element() (:: schema-element(ns1:removeMultipleEsnToAccountResponse) ::), 
                                                                 $errorCodesMap as element() (:: schema-element(ns3:dvm) ::)) 
                                                                 as element() (:: schema-element(ns2:deleteDeviceResponse) ::) {
    <ns2:deleteDeviceResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($removeMultipleEsnToAccountResponse/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($removeMultipleEsnToAccountResponse/com:requestToken/com:clientId)}</com:clientId>
                    </com:requestToken>
                    
                     {
		            	if(fn:exists($errorCodesMap/ns3:rows/ns3:row[ns3:cell[1]/text()=$removeMultipleEsnToAccountResponse/com:result/com:code/text()]/ns3:cell[2]/text()) = xs:boolean("false"))then
		                <com:result>
		                    <com:code>{ data($removeMultipleEsnToAccountResponse/com:result/com:code) }</com:code>
		                    <com:message>{ data($removeMultipleEsnToAccountResponse/com:result/com:message) }</com:message>
		                </com:result>
		    			else
		    			<com:result>
		                    <com:code>{ $errorCodesMap/ns3:rows/ns3:row[ns3:cell[1]/text()=$removeMultipleEsnToAccountResponse/com:result/com:code/text()]/ns3:cell[2]/text()}</com:code>
		                    <com:message>{ $errorCodesMap/ns3:rows/ns3:row[ns3:cell[1]/text()=$removeMultipleEsnToAccountResponse/com:result/com:code/text()]/ns3:cell[3]/text()}</com:message>
		    			</com:result>
		}
		
    </ns2:deleteDeviceResponse>
};

local:RemoveEsnFromAccount2DeleteDeviceResponse($removeMultipleEsnToAccountResponse, $errorCodesMap)
