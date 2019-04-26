xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns2="http://www.tracfone.com/SubmitE911AddressCaseOS";
(:: import schema at "../xsd/SubmitE911AddressCaseOS.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $SubmitE911AddressCaseRequestType as element() (:: schema-element(ns1:submitE911AddressCaseRequest) ::) external;

declare function local:SubmitE911AddressCaseRequest($SubmitE911AddressCaseRequestType as element() (:: schema-element(ns1:submitE911AddressCaseRequest) ::)) as element() (:: schema-element(ns2:submitE911AddressCaseRequest) ::) {
    <ns2:submitE911AddressCaseRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($SubmitE911AddressCaseRequestType/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($SubmitE911AddressCaseRequestType/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($SubmitE911AddressCaseRequestType/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($SubmitE911AddressCaseRequestType/com:sourceSystem)}</com:sourceSystem>
        {
            if ($SubmitE911AddressCaseRequestType/com:language)
            then <com:language>{fn:data($SubmitE911AddressCaseRequestType/com:language)}</com:language>
            else ()
        }
      <ns2:createTicket>
            <ns2:issue>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:issue)}</ns2:issue>
            <ns2:shippingAddress>
                <com:streetAddress>
                    <com:line1>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:shippingAddress/com:streetAddress/com:line1)}</com:line1>
                    {
                        if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:shippingAddress/com:streetAddress/com:line2)
                        then <com:line2>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:shippingAddress/com:streetAddress/com:line2)}</com:line2>
                        else ()
                    }
                </com:streetAddress>
                <com:city>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:shippingAddress/com:city)}</com:city>
                {
                    if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:shippingAddress/com:state) then 
                        <com:state>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:shippingAddress/com:state)}</com:state>
                    else
                        <com:nonUSState>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:shippingAddress/com:nonUSState)}</com:nonUSState>
                }
                <com:zipcode>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:shippingAddress/com:zipcode)}</com:zipcode>
            </ns2:shippingAddress>
            <ns2:currentEsn>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:currentEsn)}</ns2:currentEsn>
            <ns2:currentMin>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:currentMin)}</ns2:currentMin>
            <ns2:source>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:source)}</ns2:source>
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:ss)
                then <ns2:ss>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:ss)}</ns2:ss>
                else ()
            }
            <ns2:currentCarrierId>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:currentCarrierId)}</ns2:currentCarrierId>
            <ns2:currentCarrier>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:currentCarrier)}</ns2:currentCarrier>
            <ns2:currentCarrierOtherName>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:currentCarrierOtherName)}</ns2:currentCarrierOtherName>
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:unitsReplaceCaseId)
                then <ns2:unitsReplaceCaseId>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:unitsReplaceCaseId)}</ns2:unitsReplaceCaseId>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:simId)
                then <ns2:simId>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:simId)}</ns2:simId>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:notes)
                then <ns2:notes>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:notes)}</ns2:notes>
                else ()
            }
            <ns2:ticketType>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:ticketType)}</ns2:ticketType>
            <ns2:attributeAssignedCarrierId>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:attributeAssignedCarrierId)}</ns2:attributeAssignedCarrierId>
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:attributeAccount)
                then <ns2:attributeAccount>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:attributeAccount)}</ns2:attributeAccount>
                else ()
            }
            <ns2:customerObjId>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:customerObjId)}</ns2:customerObjId>
            <ns2:customerName>
                <com:firstName>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:customerName/com:firstName)}</com:firstName>
                <com:lastName>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:customerName/com:lastName)}</com:lastName>
            </ns2:customerName>
            <ns2:customerAddress>
                <com:streetAddress>
                    <com:line1>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:customerAddress/com:streetAddress/com:line1)}</com:line1>
                    {
                        if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:customerAddress/com:streetAddress/com:line2)
                        then <com:line2>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:customerAddress/com:streetAddress/com:line2)}</com:line2>
                        else ()
                    }
                </com:streetAddress>
                <com:city>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:customerAddress/com:city)}</com:city>
                {
                    if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:customerAddress/com:state) then 
                        <com:state>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:customerAddress/com:state)}</com:state>
                    else
                        <com:nonUSState>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:customerAddress/com:nonUSState)}</com:nonUSState>
                }
                <com:zipcode>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:customerAddress/com:zipcode)}</com:zipcode>
            </ns2:customerAddress>
            <ns2:ticketPriority>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:ticketPriority)}</ns2:ticketPriority>
            <ns2:pointOfContact>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:pointOfContact)}</ns2:pointOfContact>
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:ratePlan)
                then <ns2:ratePlan>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:ratePlan)}</ns2:ratePlan>
                else ()
            }
            <ns2:assignedCarrier>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:assignedCarrier)}</ns2:assignedCarrier>
            <ns2:agent>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:agent)}</ns2:agent>
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:homePhone)
                then <ns2:homePhone>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:homePhone)}</ns2:homePhone>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:populateCustomer)
                then <ns2:populateCustomer>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:populateCustomer)}</ns2:populateCustomer>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:attributeRecurrent)
                then <ns2:attributeRecurrent>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:attributeRecurrent)}</ns2:attributeRecurrent>
                else ()
            }
            <ns2:targetEsn>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:targetEsn)}</ns2:targetEsn>
            <ns2:ticketTitle>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:ticketTitle)}</ns2:ticketTitle>
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:attributeActivationZipcode)
                then <ns2:attributeActivationZipcode>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:attributeActivationZipcode)}</ns2:attributeActivationZipcode>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:attributePin)
                then <ns2:attributePin>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:attributePin)}</ns2:attributePin>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeServicePlan)
                then <ns2:AttributeServicePlan>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeServicePlan)}</ns2:AttributeServicePlan>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeEnrollAutoRefill)
                then <ns2:AttributeEnrollAutoRefill>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeEnrollAutoRefill)}</ns2:AttributeEnrollAutoRefill>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeEnrollPaymentSource)
                then <ns2:AttributeEnrollPaymentSource>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeEnrollPaymentSource)}</ns2:AttributeEnrollPaymentSource>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeEnnrollRecurrentPlan)
                then <ns2:AttributeEnnrollRecurrentPlan>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeEnnrollRecurrentPlan)}</ns2:AttributeEnnrollRecurrentPlan>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeEnrollNextChargeDate)
                then <ns2:AttributeEnrollNextChargeDate>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeEnrollNextChargeDate)}</ns2:AttributeEnrollNextChargeDate>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeNewMSID)
                then <ns2:AttributeNewMSID>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeNewMSID)}</ns2:AttributeNewMSID>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:CustomerEmail)
                then <ns2:CustomerEmail>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:CustomerEmail)}</ns2:CustomerEmail>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeZipCode)
                then <ns2:AttributeZipCode>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeZipCode)}</ns2:AttributeZipCode>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:PartNumber)
                then <ns2:PartNumber>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:PartNumber)}</ns2:PartNumber>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:Priority)
                then <ns2:Priority>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:Priority)}</ns2:Priority>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:CustomerFirstName)
                then <ns2:CustomerFirstName>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:CustomerFirstName)}</ns2:CustomerFirstName>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCustEmail)
                then <ns2:AttributeCustEmail>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCustEmail)}</ns2:AttributeCustEmail>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCurrentAddrHouseNumber)
                then <ns2:AttributeCurrentAddrHouseNumber>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCurrentAddrHouseNumber)}</ns2:AttributeCurrentAddrHouseNumber>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCurrAddrDirection)
                then <ns2:AttributeCurrAddrDirection>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCurrAddrDirection)}</ns2:AttributeCurrAddrDirection>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCurrAddrStreetName)
                then <ns2:AttributeCurrAddrStreetName>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCurrAddrStreetName)}</ns2:AttributeCurrAddrStreetName>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCurrAddrStreetType)
                then <ns2:AttributeCurrAddrStreetType>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCurrAddrStreetType)}</ns2:AttributeCurrAddrStreetType>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCurrAddrUnit)
                then <ns2:AttributeCurrAddrUnit>{fn:data($SubmitE911AddressCaseRequestType/ns1:createTicket/ns1:AttributeCurrAddrUnit)}</ns2:AttributeCurrAddrUnit>
                else ()
            }</ns2:createTicket>
        <ns2:createCallTrans>
            <ns2:esn>{fn:data($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:esn)}</ns2:esn>
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:actionType)
                then <ns2:actionType>{fn:data($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:actionType)}</ns2:actionType>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:subSourceSystem)
                then <ns2:subSourceSystem>{fn:data($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:subSourceSystem)}</ns2:subSourceSystem>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:reason)
                then <ns2:reason>{fn:data($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:reason)}</ns2:reason>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:result)
                then <ns2:result>{fn:data($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:result)}</ns2:result>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:otaRequestType)
                then <ns2:otaRequestType>{fn:data($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:otaRequestType)}</ns2:otaRequestType>
                else ()
            }
            {
                if ($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:otaType)
                then <ns2:otaType>{fn:data($SubmitE911AddressCaseRequestType/ns1:createCallTrans/ns1:otaType)}</ns2:otaType>
                else ()
            }</ns2:createCallTrans>
      <ns2:createActionItemIGTransaction>
          <ns2:contactObjId>{fn:data($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:contactObjId)}</ns2:contactObjId>
          <ns2:callTransObjId>{fn:data($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:callTransObjId)}</ns2:callTransObjId>
          {
              if ($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:orderType)
              then <ns2:orderType>{fn:data($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:orderType)}</ns2:orderType>
              else ()
          }
          {
              if ($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:byPassOrderType)
              then <ns2:byPassOrderType>{fn:data($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:byPassOrderType)}</ns2:byPassOrderType>
              else ()
          }
          {
              if ($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:caseCode)
              then <ns2:caseCode>{fn:data($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:caseCode)}</ns2:caseCode>
              else ()
          }
          {
              if ($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:transMethod)
              then <ns2:transMethod>{fn:data($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:transMethod)}</ns2:transMethod>
              else ()
          }
          <ns2:transactionDetails>
              {
                  if ($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:transactionDetails/ns1:applicationSystem)
                  then <ns2:applicationSystem>{fn:data($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:transactionDetails/ns1:applicationSystem)}</ns2:applicationSystem>
                  else ()
              }
              {
                  if ($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:transactionDetails/ns1:serviceDays)
                  then <ns2:serviceDays>{fn:data($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:transactionDetails/ns1:serviceDays)}</ns2:serviceDays>
                  else ()
              }
              {
                  if ($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:transactionDetails/ns1:voiceUnits)
                  then <ns2:voiceUnits>{fn:data($SubmitE911AddressCaseRequestType/ns1:createActionItemIGTransaction/ns1:transactionDetails/ns1:voiceUnits)}</ns2:voiceUnits>
                  else ()
              }
              <ns2:textUnits></ns2:textUnits>
              <ns2:dataUnits></ns2:dataUnits>
          </ns2:transactionDetails>
      </ns2:createActionItemIGTransaction>
    </ns2:submitE911AddressCaseRequest>
};

local:SubmitE911AddressCaseRequest($SubmitE911AddressCaseRequestType)
