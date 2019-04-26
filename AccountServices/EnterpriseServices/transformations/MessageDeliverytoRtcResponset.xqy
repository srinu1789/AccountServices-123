xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$notifyResponse1" element="ns3:notifyResponse" location="../../../EventManagementOSB/EnterpriseServices/xsd/EventManagementServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:forgotPasswordResponse" location="../xsd/AccountServices.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns3 = "http://b2b.tracfone.com/EventManagement";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/MessageDeliverytoRtcResponset/";

declare function xf:MessageDeliverytoRtcResponset($notifyResponse1 as element(ns3:notifyResponse))
    as element(ns2:forgotPasswordResponse) {
        <ns2:forgotPasswordResponse>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($notifyResponse1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($notifyResponse1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:result>
                <ns0:code>0</ns0:code>
                <ns0:message>SUCESS</ns0:message>
            </ns0:result>
        </ns2:forgotPasswordResponse>
};

declare variable $notifyResponse1 as element(ns3:notifyResponse) external;

xf:MessageDeliverytoRtcResponset($notifyResponse1)