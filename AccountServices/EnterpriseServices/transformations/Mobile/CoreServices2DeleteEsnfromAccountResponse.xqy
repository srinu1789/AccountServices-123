xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$errorCodesMap" element="ns4:dvm" location="../../../../TFCommon/xsd/dvm.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$removeMultipleEsnToAccountResponse1" element="ns3:removeMultipleEsnToAccountResponse" location="../../../CoreServices/xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:deleteEsnFromAccountResponse" location="../../xsd/MobileAccountServices.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/MobileAccountServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns3 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns4 = "http://xmlns.oracle.com/dvm";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/removeEsnfromAccountToDeleteEsnfromAccountResponse/";

declare function xf:removeEsnfromAccountToDeleteEsnfromAccountResponse($errorCodesMap as element(ns4:dvm),$removeMultipleEsnToAccountResponse1 as element(ns3:removeMultipleEsnToAccountResponse))
    as element(ns2:deleteEsnFromAccountResponse) {
        <ns2:deleteEsnFromAccountResponse>
           {
        	if(fn:exists($errorCodesMap/ns4:rows/ns4:row[ns4:cell[1]/text()=$removeMultipleEsnToAccountResponse1/ns0:result/ns0:code/text()]/ns4:cell[2]/text()) = xs:boolean("false"))then
            <ns0:result>
                <ns0:code>{ data($removeMultipleEsnToAccountResponse1/ns0:result/ns0:code) }</ns0:code>
                <ns0:message>{ data($removeMultipleEsnToAccountResponse1/ns0:result/ns0:message) }</ns0:message>
            </ns0:result>
			else
			<ns0:result>
                <ns0:code>{ $errorCodesMap/ns4:rows/ns4:row[ns4:cell[1]/text()=$removeMultipleEsnToAccountResponse1/ns0:result/ns0:code/text()]/ns4:cell[2]/text()}</ns0:code>
                <ns0:message>{ $errorCodesMap/ns4:rows/ns4:row[ns4:cell[1]/text()=$removeMultipleEsnToAccountResponse1/ns0:result/ns0:code/text()]/ns4:cell[3]/text()}</ns0:message>
			</ns0:result>
		}
        </ns2:deleteEsnFromAccountResponse>
};

declare variable $removeMultipleEsnToAccountResponse1 as element(ns3:removeMultipleEsnToAccountResponse) external;
declare variable $errorCodesMap as element(ns4:dvm) external;

xf:removeEsnfromAccountToDeleteEsnfromAccountResponse($errorCodesMap,$removeMultipleEsnToAccountResponse1)