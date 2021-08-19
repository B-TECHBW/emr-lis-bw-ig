/* 
========================================================== EXAMPLES ==========================================================
==============================================================================================================================
*/

Instance: example-pims-patient
InstanceOf: BwPatient 
Usage: #example 
Description: "Example PIMS Patient"
Title:   "PIMS Patient"
* name.use = #official
* name.family = "PimsPatient"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1988-03-02"
* identifier[+].value = "urn:uuid:<Pims-specific Patient ID>"
* identifier[=].system = "urn:ietf:rfc:3986"
* identifier[=].type = #MR
* identifier[+].value = "<OmangNumber>"
* identifier[=].system = "http://moh.bw.org/ext/identifier/omang"
* identifier[=].use = #official
* managingOrganization = Reference(example-facility-order-creator)

Instance: example-ipms-patient
InstanceOf: BwPatient 
Usage: #example 
Description: "Example IPMS Patient"
Title:   "IPMS Patient"
* name.use = #official
* name.family = "IpmsPatient"
* name.given[+] = "Demo"
* gender = #male
* birthDate = "1948-01-22"
* identifier[+].value = "urn:uuid:<IPMS Patient ID>"
* identifier[=].system = "urn:ietf:rfc:3986"
* identifier[=].type = #MR
* identifier[+].value = "<OmangNumber>"
* identifier[=].system = "http://moh.bw.org/ext/identifier/omang"
* identifier[=].use = #official
* managingOrganization = Reference(example-facility-order-reciever)

Instance: example-pims-patient-international
InstanceOf: BwPatient 
Usage: #example 
Description: "Example International Botswana Patient"
Title:   "BW Patient"
* name.text = "Bw TestPatient"
* gender = #female
* birthDate = "1988-03-02"
* identifier.value = "urn:uuid:<Pims-specific Patient ID>"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "<PassportNumber>"
* identifier.type = #PPN

// mCSD Location & Facility
Instance: example-facility-order-creator
// InstanceOf: MCSDFacilityOrganization
InstanceOf: Organization
Title: "PIMS Facility"
Usage: #example
Description: "Example PIMS Facility"
* type[+].coding[+].system = "urn:ietf:rfc:3986"
* type[=].coding[=].code = #prov
* type[+].coding[+].system = "https://github.com/ihe/ITI.mCSD"
* type[=].coding[=].code = #Facility
* active = true

Instance: example-location-order-creator
// InstanceOf: MCSDFacilityLocation
InstanceOf: Location
Title: "PIMS Location"
Usage: #example
Description: "Example PIMS Facility Location"
* status = #active
* type[+].coding[+].system = "urn:ietf:rfc:3986"
* type[=].coding[=].code = #HOSP
* type[+].coding[+].system = "https://github.com/ihe/ITI.mCSD"
* type[=].coding[=].code = #Facility
* physicalType = #bu
* managingOrganization = Reference(example-facility-order-creator)

Instance: example-facility-order-reciever
// InstanceOf: MCSDFacilityOrganization
InstanceOf: Organization
Title: "IPMS Facility"
Usage: #example
Description: "Example IPMS Facility"
* type[+].coding[+].system = "urn:ietf:rfc:3986"
* type[=].coding[=].code = #dept
* type[+].coding[+].system = "https://github.com/ihe/ITI.mCSD"
* type[=].coding[=].code = #Facility
* active = true

Instance: example-location-order-reciever
// InstanceOf: MCSDFacilityLocation
InstanceOf: Location
Title: "IPMS Location"
Usage: #example
Description: "Example IPMS Facility Location"
* status = #active
* type[+].coding[+].system = "urn:ietf:rfc:3986"
* type[=].coding[=].code = #HLAB
* type[+].coding[+].system = "https://github.com/ihe/ITI.mCSD"
* type[=].coding[=].code = #Facility
* physicalType = #bu
* managingOrganization = Reference(example-facility-order-reciever)

Instance: example-bw-task-requested
InstanceOf: BwLabTask 
Usage: #example 
Description: "Example Task for Requested Lab Orders and Results in Botswana"
Title:   "BW Requested Lab Task"
* identifier.value = "PimsSpecificLabOrderID"
* identifier.system = "http://<pims-instance-specific-url>/ext/lab-task/identifier"   
* basedOn[+] = Reference(example-bw-pims-service-request-1)
* basedOn[+] = Reference(example-bw-pims-service-request-2)
* status = #requested
* intent = #order
* for = Reference(example-pims-patient)
* authoredOn = "2021-05-20"
* owner = Reference(example-facility-order-reciever)
* location = Reference(example-location-order-creator)

Instance: example-bw-pims-service-request-profile
InstanceOf: BwServiceRequest
Usage: #example
Description: "Example ServiceRequest resource representing a PIMS Profile"
Title: "BW PIMS ServiceRequest Profile"
* status = #active
* intent = #order
* code.coding[+].system = "http://moh.bw.org/ext/laboratory/pims-lab-profile-code"
* code.coding[=].code = #pims-profile-code
* subject = Reference(example-pims-patient)

Instance: example-bw-pims-service-request-1
InstanceOf: BwServiceRequest
Usage: #example
Description: "Example ServiceRequest resource representing a PIMS Lab Order"
Title: "BW PIMS ServiceRequest 1"
* status = #active
* intent = #order
* code.coding[+].system = "http://moh.bw.org/ext/laboratory/pims-lab-test-code"
* code.coding[=].code = #pims-labtest-code
* basedOn[+] = Reference(example-bw-pims-service-request-profile)
* subject = Reference(example-pims-patient)

Instance: example-bw-pims-service-request-2
InstanceOf: BwServiceRequest
Usage: #example
Description: "Example ServiceRequest resource representing a PIMS Lab Order"
Title: "BW PIMS ServiceRequest 2"
* status = #active
* intent = #order
* code.coding[+].system = "http://moh.bw.org/ext/laboratory/pims-lab-test-code"
* code.coding[=].code = #pims-labtest-code
* basedOn[+] = Reference(example-bw-pims-service-request-profile)
* subject = Reference(example-pims-patient)

Instance: example-bw-pims-practitioner
InstanceOf: BwPractitioner
Usage: #example
Description: "Example PIMS Practitioner"
Title: "BW PIMS Practitioner"
* name[+].text = "BW PimsProvider"
* identifier[+].value = "RequesterID"
* identifier[=].system = "http://<pims-instance-specific-url>/ext/practitioner/identifier"   


Instance: example-bw-lab-composition
InstanceOf: BwLabComposition
Usage: #example
Description: "Example Lab Order Composition"
Title: "Example PIMS Lab Composition"
* type = #document
* subject = Reference(example-pims-patient)
* date = "2021-06-06"
* author = Reference(example-bw-practitioner)
* section[labTask].entry[+] = Reference(example-bw-task-requested)
* section[labOrders].entry[+] = Reference(example-bw-pims-service-request-profile)
* section[labOrders].entry[+] = Reference(example-bw-pims-service-request-1)
* section[labOrders].entry[+] = Reference(example-bw-pims-service-request-2)


Instance: example-bw-lab-bundle
InstanceOf: Bundle
Usage: #example
Description: "Example Full PIMS Lab Bundle"
Title: "Example Lab Bundle"
* type = #document
* entry[+].resource = example-bw-lab-composition
* entry[+].resource = example-pims-patient
* entry[+].resource = example-bw-pims-practitioner
* entry[+].resource = example-bw-task-requested
* entry[+].resource = example-bw-pims-service-request-profile
* entry[+].resource = example-bw-pims-service-request-1
* entry[+].resource = example-bw-pims-service-request-2
