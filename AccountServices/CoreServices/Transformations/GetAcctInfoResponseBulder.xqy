xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$getAccountInformation1" type="GetAccountInformationResponseType/getAccountInformation" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns3:getAccountInformationResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns3 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace ns5 = "";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2GetAcctInfoResponse/";

declare function xf:CBO2GetAcctInfoResponse($getAccountInformation1 as element(),
    $paymentSourceObjId as xs:string)
    as element(ns3:getAccountInformationResponse) {
        <ns3:getAccountInformationResponse>
            <ns1:result>
                <ns1:code>{ data($getAccountInformation1/ERROR_NUM) }</ns1:code>
                <ns1:message>{ data($getAccountInformation1/ERROR_STRING) }</ns1:message>
            </ns1:result>
            <ns3:servicePlanId>{ data($getAccountInformation1/CONTACT_OBJID) }</ns3:servicePlanId>
            <ns3:isUnlimitedServicePlan>{ xs:boolean(data($getAccountInformation1/DEDICATED_UNLIMITED_PLAN_HANDSET0)) }</ns3:isUnlimitedServicePlan>
            <ns3:endOfServiceDate>{ data($getAccountInformation1/EXPIRY_DATE0) }</ns3:endOfServiceDate>
            <ns3:queueSize>{ data($getAccountInformation1/NO_OF_RED_CARDS_IN_Q0) }</ns3:queueSize>
            <ns3:handsetStatus>
                <ns0:statusName>{ data($getAccountInformation1/ESN_STATUS0) }</ns0:statusName>
            </ns3:handsetStatus>
            <ns3:isAutoRefill>{ xs:boolean(data($getAccountInformation1/ns5:PROGRAM_IS_RECURRING0_0)) }</ns3:isAutoRefill>
            <ns3:hasCreditCard>
                {
                    if (xs:int($paymentSourceObjId) > 0) then
                        (xs:boolean("true"))
                    else 
                        xs:boolean("false")
                }
</ns3:hasCreditCard>
            <ns3:defaultESN>{ data($getAccountInformation1/DEFAULT_ESN) }</ns3:defaultESN>
            <ns3:contactObjId>{ data($getAccountInformation1/CONTACT_OBJID) }</ns3:contactObjId>
        </ns3:getAccountInformationResponse>
};

declare variable $getAccountInformation1 as element() external;
declare variable $paymentSourceObjId as xs:string external;

xf:CBO2GetAcctInfoResponse($getAccountInformation1,
    $paymentSourceObjId)