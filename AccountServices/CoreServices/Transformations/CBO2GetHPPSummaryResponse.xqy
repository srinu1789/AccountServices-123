xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

(:: pragma bea:local-element-complex-parameter parameter="$getHPPSummary1" type="getHPPSummaryResponseType/getHppSummary" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getHPPSummaryResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns1="http://www.tracfone.com/AccountCoreServices";
(:: import schema at "../xsd/AccountCoreServices.xsd" ::)
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";

declare variable $getHPPSummary1 as element() external;

declare function local:func($getHPPSummary1 as element())  as element() (:: schema-element(ns1:getHPPSummaryResponse) ::) {
    <ns1:getHPPSummaryResponse>      
        <ns0:result>
            <ns0:code>{fn:data($getHPPSummary1/ERROR_NUM)}</ns0:code>
            <ns0:message>{fn:data($getHPPSummary1/ERROR_STRING)}</ns0:message>
        </ns0:result>
        <ns1:deductibleAmount>{fn:data($getHPPSummary1/DEDUCTIBLE_AMOUNT)}</ns1:deductibleAmount>
        <ns1:hppEnrolId>{fn:data($getHPPSummary1/HPP_ENROL_ID)}</ns1:hppEnrolId>
        <ns1:next_charge_date>{fn:data($getHPPSummary1/NEXT_CHARGE_DATE)}</ns1:next_charge_date>
        <ns1:status>{fn:data($getHPPSummary1/STATUS)}</ns1:status>
        <ns1:contractNumber>{fn:data($getHPPSummary1/CONTRACT_NUMBER)}</ns1:contractNumber>
        <ns1:expirationDate>{fn:data($getHPPSummary1/EXPIRATION_DATE)}</ns1:expirationDate>
        <ns1:hppClaimSize>{fn:data($getHPPSummary1/HPP_CLAIM_SIZE)}</ns1:hppClaimSize>
        <ns1:planName>{fn:data($getHPPSummary1/PLAN_NAME)}</ns1:planName>
        <ns1:enrollmentDate>{fn:data($getHPPSummary1/ENROLLMENT_DATE)}</ns1:enrollmentDate>
        <ns1:hppProgId>{fn:data($getHPPSummary1/HPP_PROG_ID)}</ns1:hppProgId>
        <ns1:server>{fn:data($getHPPSummary1/SERVER)}</ns1:server>
    </ns1:getHPPSummaryResponse>
};

local:func($getHPPSummary1)
