pragma solidity ^0.4.21;

contract transplantChain {
    

    //Declaring the roles for the contract 
    struct Patient {
        string bloodType;
        bytes32 HLA;
        uint age;
        bool operationEligibility;
        uint position;
        bool isDonor;
        address patient;
    }
    
    mapping(address => Patient) public patients;
    address[] public patientAccts;
    
    
   modifier donorOnly() {
        require(msg.sender == donor);
        _;
    } 
    
    modifier doctorOneOnly() {
        require(msg.sender == doctorOne);
        _;
    }
    
    modifier doctorTwoOnly() {
        require(msg.sender == doctorTwo);
        _;
    }

    
    //Declaring Varibles
    address public doctorOne;
    address public doctorTwo;
    address public donor;
    address public reciever; 

    uint sendPart;
    
    function transplantChain(address _patient, address _doctorOne, address _doctorTwo, address _donor) payable {
        doctorOne = _doctorOne;
        doctorTwo = _doctorTwo;
    } 
    
    function setData(address _username, string _bloodType, bytes32 _HLA, uint _age, bool _operationEligibility, uint _position, bool _isDonor, address _patient) {
        var Patient = patients[_username];
        
        Patient.bloodType = _bloodType;
        Patient.HLA = _HLA;
        Patient.age = _age;
        Patient.operationEligibility = _operationEligibility;
        Patient.position = _position;
        Patient.isDonor = _isDonor;
        Patient.patient = _patient;
        
        if (Patient.isDonor == true) donor = msg.sender;
        if (Patient.isDonor == true) reciever = msg.sender;
        
        patientAccts.push(_username) -1;
    }
    
    function firstValidation(bool confirm) doctorOneOnly public payable{
        if (confirm == true) sendPart += 1;
        if (sendPart == 2) reciever.transfer[this.balance];
    } 
    
    function secondValidation(bool confirm) doctorTwoOnly public payable {
        if (confirm == true) sendPart += 1;
        if (sendPart == 2) reciever.transfer[this.balance];
    }
    
} 