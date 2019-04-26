xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$getAccountInformation1" type="GetAccountInformationResponseType/getAccountInformation" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns3:getAccountInformationResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns3 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2GetAccountInfoForgotPasswordResponse/";

declare function xf:CBO2GetAccountInfoForgotPasswordResponse($getAccountInformation1 as element())
    as element(ns3:getAccountInformationResponse) {
        <ns3:getAccountInformationResponse>
            <ns1:result>
                <ns1:code>{ data($getAccountInformation1/ESN_ERROR_NUM0) }</ns1:code>
                <ns1:message>{ data($getAccountInformation1/ESN_ERROR_STRING0) }</ns1:message>
            </ns1:result>
            <ns3:min>{ data($getAccountInformation1/MIN0) }</ns3:min>
        </ns3:getAccountInformationResponse>
};

declare variable $getAccountInformation1 as element() external;

xf:CBO2GetAccountInfoForgotPasswordResponse($getAccountInformation1)