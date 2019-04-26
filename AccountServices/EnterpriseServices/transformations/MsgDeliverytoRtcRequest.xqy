xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$forgotPasswordRequest1" element="ns4:forgotPasswordRequest" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns5:notifyRequest" location="../../../EventManagementOSB/EnterpriseServices/xsd/EventManagementServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/EventCommonTypes";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns4 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns3 = "http://www.tracfone.com/OrganizationCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace ns5 = "http://b2b.tracfone.com/EventManagement";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/MsgDeliverytoRtcRequest/";

declare function xf:MsgDeliverytoRtcRequest($forgotPasswordRequest1 as element(ns4:forgotPasswordRequest),
    $string1 as xs:string,
    $string2 as xs:string,
    $string3 as xs:string,
    $string4 as xs:string)
    as element(ns5:notifyRequest) {
        <ns5:notifyRequest>
            <ns1:requestToken>{ $forgotPasswordRequest1/ns1:requestToken/@* , $forgotPasswordRequest1/ns1:requestToken/node() }</ns1:requestToken>
            <ns1:brandName>{ data($forgotPasswordRequest1/ns1:brandName) }</ns1:brandName>
            <ns1:sourceSystem>{ data($forgotPasswordRequest1/ns1:sourceSystem) }</ns1:sourceSystem>
            {
                for $language in $forgotPasswordRequest1/ns1:language
                return
                    <ns1:language>{ data($language) }</ns1:language>
            }
            <ns5:event>
                <ns2:rtcForgotPassword>
                    <ns2:processName>FORGOT_PASSWORD</ns2:processName>
                    <ns2:emailEvent>
                        <ns2:customerEmail>{ data($forgotPasswordRequest1/ns4:emailID) }</ns2:customerEmail>
                        <ns2:customerName>
                            <firstName>{ $string1 }</firstName>
                            <lastName>{ $string2 }</lastName>
                        </ns2:customerName>
                        <ns2:udf2>{ $string3 }</ns2:udf2>
                    </ns2:emailEvent>
                </ns2:rtcForgotPassword>
            </ns5:event>
        </ns5:notifyRequest>
};

declare variable $forgotPasswordRequest1 as element(ns4:forgotPasswordRequest) external;
declare variable $string1 as xs:string external;
declare variable $string2 as xs:string external;
declare variable $string3 as xs:string external;
declare variable $string4 as xs:string external;

xf:MsgDeliverytoRtcRequest($forgotPasswordRequest1,
    $string1,
    $string2,
    $string3,
    $string4)