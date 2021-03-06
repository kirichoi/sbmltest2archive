(* 

category:      Test
synopsis:      Basic two reactions with four species in one compartment
               and an event that assigns value to two species, subject to a delay.
componentTags: Compartment, Species, Reaction, Parameter, EventWithDelay 
testTags:      Concentration, NonUnityCompartment
testType:      TimeCourse
levels:        2.1, 2.2, 2.3, 2.4, 3.1
generatedBy:   Numeric

The model contains one compartment called C.  There are four species called
S1, S2, S3 and S4 and two parameters called k1 and k2.  The model contains
two reactions defined as:

[{width:30em,margin: 1em auto}|  *Reaction*  |  *Rate*  |
| S1 + S2 -> S3 + S4 | $k1 * S1 * S2 * C$  |
| S3 + S4 -> S1 + S2 | $k2 * S3 * S4 * C$  |]

The model contains one event that assigns values to both species S1 and S4:

[{width:30em,margin: 1em auto}| | *Trigger* | *Delay* | *Assignments*         |
 | Event1                      | $S4 > S2$ | $2.5$   | $S1 -> 2 \x 10^-4$   |]
 |                             |           |         | $S4 -> 0.5 \x 10^-4$ |]

The initial conditions are as follows:

[{width:30em,margin: 1em auto}| |*Value*          |*Units*  |
|Initial concentration of S1          |$1.0 \x 10^-4$  |mole litre^-1^                       |
|Initial concentration of S2          |$1.0 \x 10^-4$  |mole litre^-1^                       |
|Initial concentration of S3          |$2.0 \x 10^-4$  |mole litre^-1^                       |
|Initial concentration of S4          |$1.0 \x 10^-4$  |mole litre^-1^                       |
|Value of parameter k1         |$0.75 \x 10^4$  |litre mole^-1^ second^-1^  |
|Value of parameter k2         |$0.25 \x 10^4$  |litre mole^-1^ second^-1^  |
|Volume of compartment C       |$0.25$           |litre                      |]

*)

newcase[ "00768" ];

addCompartment[ C, size -> 0.25 ];
addSpecies[ S1, initialConcentration -> 1.0 10^-4];
addSpecies[ S2, initialConcentration -> 1.2 10^-4];
addSpecies[ S3, initialConcentration -> 2.0 10^-4];
addSpecies[ S4, initialConcentration -> 1.0 10^-4];
addParameter[ k1, value -> 0.75 10^4 ];
addParameter[ k2, value -> 0.25 10^4 ];
addReaction[ S1 + S2 -> S3 + S4, reversible -> False,
	     kineticLaw -> k1 * S1 * S2 * C ];
addReaction[ S3 + S4 -> S1 + S2, reversible -> False,
	     kineticLaw -> k2 * S3 * S4 * C ];
addEvent[ trigger -> S4 > S2, delay->2.5, eventAssignment -> {S1->2 10^-4, S4->5 10^-5}  ];

makemodel[]
