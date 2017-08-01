require 'date'

spacex = Organization.create(name: "SpaceX", about:
"SpaceX is flying numerous cargo resupply missions to the International Space Station, 
for a total of at least 20 flights under the Commercial Resupply Services contract. 
In 2016, NASA awarded SpaceX a second version of that contract that will cover a minimum
of 6 additional flights from 2019 onward. Dragon was designed from the outset to carry 
astronauts to space, and as early as 2018, SpaceX will carry crew as part of NASA's Commercial Crew Program.  
SpaceX is the world’s fastest-growing provider of launch services and has over 70 future missions on its manifest, 
representing over $10 billion in contracts. These include commercial satellite launches as well as NASA and other US Government missions.
Currently under development is the Falcon Heavy, which will be the world’s most powerful rocket. 
All the while, SpaceX continues to work toward one of its key goals—developing fully and rapidly reusable rockets, 
a feat that will transform space exploration by delivering highly reliable vehicles at radically reduced costs."
)
rocket_sx1 = Rocket.create(name: "Falcon9", stages: 2, 
about:"Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of satellites and the Dragon spacecraft 
into orbit. Falcon 9 is the first orbital class rocket capable of reflight. SpaceX believes rocket reusability is the key breakthrough needed to reduce the 
cost of access to space and enable people to live on other planets. Falcon 9 was designed from the ground up for maximum reliability. Falcon 9’s simple 
two-stage configuration minimizes the number of separation events -- and with nine first-stage engines, it can safely complete its 
mission even in the event of an engine shutdown.", 
mission:
"A SpaceX Falcon 9 rocket will launch the 14th Dragon spacecraft on the 12th operational 
cargo delivery mission to the International Space Station. The flight is being conducted under 
the Commercial Resupply Services contract with NASA. The Falcon 9 rocket’s first stage will return to 
landing at Cape Canaveral few minutes after liftoff. "
)

rocket_sx2 = Rocket.create(name: "Falcon9", stages: 2, 
about:"Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of satellites and the Dragon spacecraft 
into orbit. Falcon 9 is the first orbital class rocket capable of reflight. SpaceX believes rocket reusability is the key breakthrough needed to reduce the 
cost of access to space and enable people to live on other planets. Falcon 9 was designed from the ground up for maximum reliability. Falcon 9’s simple two-stage configuration minimizes the number of separation events 
-- and with nine first-stage engines, it can safely complete its mission even in the event of an engine shutdown.", 
mission:
"Carrying the Dragon resupply spacecraft on the sixth commercial resupply services mission to the International Space Station. 
Liftoff was at 4:10 p.m. EDT, Tuesday, April 14. Research that will help prepare NASA astronauts and robotic explorers for future missions to Mars is 
among the two tons of cargo on its way to the International Space Station aboard Dragon."
)

blue_origin = Organization.create(name: "Blue Origin", about: 
<<-text
Blue Origin is an American privately funded aerospace manufacturer and spaceflight services company set up by Amazon.com founder
Jeff Bezos with its headquarters in Kent, Washington. The company is developing technologies to enable private human access to 
space with the goal to dramatically lower costs and increase reliability. Blue Origin is employing an incremental approach from suborbital to orbital flight, 
with each developmental step building on its prior work. The company motto is "Gradatim Ferociter", Latin for "Step by Step, Ferociously". 
Blue Origin is developing a variety of technologies, with a focus on rocket-powered Vertical Takeoff and Vertical Landing (VTVL) vehicles for access 
to suborbital and orbital space.
text
)
rocket_bo1 = Rocket.create(name: "New Glenn", stages: 2, 
about:
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi commodo purus vitae odio aliquet ultricies. 
Curabitur feugiat dui et quam malesuada, a accumsan sapien fermentum. Proin blandit lacinia arcu, at accumsan 
lectus scelerisque nec. Morbi fringilla, purus sit amet rutrum malesuada, libero lorem varius arcu, 
nec gravida diam enim ac justo. Phasellus sit amet justo quis arcu euismod tempus. Fusce erat eros, 
placerat vitae leo elementum, eleifend aliquet risus. Donec tempus, ex iaculis rhoncus congue, 
urna diam convallis nisi, sit amet iaculis purus tortor vitae dolor.", 
mission:
"Vestibulum accumsan interdum euismod. Suspendisse sed laoreet purus. In hendrerit sapien erat, a tincidunt est viverra ut. 
Proin efficitur eget libero non convallis. Aenean accumsan ut erat non ultricies. Vestibulum non vulputate felis. Vivamus in nisl arcu. 
Etiam molestie, leo eu sollicitudin eleifend, felis dolor vulputate orci, sodales porta nisi lectus a enim. Morbi eu diam et risus blandit ullamcorper et eget massa. 
Cras cursus sapien eu tellus ultrices, sit amet molestie nisi faucibus."
)

rocket_bo2 = Rocket.create(name: "New Glenn", stages: 2, 
about:
"Vivamus faucibus malesuada sodales. Vivamus vitae metus a diam lacinia finibus elementum ut sem. 
Proin euismod mi lobortis vehicula ornare. Duis consequat auctor iaculis. Aenean venenatis pellentesque tristique. 
In a nunc lacinia, vulputate velit ut, iaculis nunc. Nullam convallis diam cursus ligula accumsan, vitae molestie eros interdum. 
Sed auctor aliquam nibh, nec ullamcorper nulla efficitur vitae. Phasellus fermentum egestas tempor.", 
mission:
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi commodo purus vitae odio aliquet ultricies. 
Curabitur feugiat dui et quam malesuada, a accumsan sapien fermentum. Proin blandit lacinia arcu, at accumsan 
lectus scelerisque nec. Morbi fringilla, purus sit amet rutrum malesuada, libero lorem varius arcu, 
nec gravida diam enim ac justo. Phasellus sit amet justo quis arcu euismod tempus. Fusce erat eros, 
placerat vitae leo elementum, eleifend aliquet risus. Donec tempus, ex iaculis rhoncus congue, 
urna diam convallis nisi, sit amet iaculis purus tortor vitae dolor."
)

virgin_galactic = Organization.create(name: "Virgin Galactic", about:
<<-text
Virgin Galactic is comprised of hundreds of dedicated and passionate professionals 
— including rocket scientists, engineers, and designers from around the world 
— united in creating something new and lasting: the world’s first commercial spaceline. 
A spaceline for Earth. Our team brings decades of experience from organizations like NASA, 
traditional aerospace firms, and other Virgin companies. We are here because we believe we are at 
the vanguard of a new space industry that is defining the future of exploration and that we will 
ultimately make space accessible to more people and for more purposes than ever before. 
It is a large and difficult undertaking; but through our efforts, we believe we can help inspire 
future generations and make it possible to see the beautiful planet we call home from a new perspective.
text
)

rocket_vg1 = Rocket.create(name: "SpaceShipTwo", stages: 1, 
about:
"Vivamus faucibus malesuada sodales. Vivamus vitae metus a diam lacinia finibus elementum ut sem. 
Proin euismod mi lobortis vehicula ornare. Duis consequat auctor iaculis. Aenean venenatis pellentesque tristique. 
In a nunc lacinia, vulputate velit ut, iaculis nunc. Nullam convallis diam cursus ligula accumsan, vitae molestie eros interdum. 
Sed auctor aliquam nibh, nec ullamcorper nulla efficitur vitae. Phasellus fermentum egestas tempor.", 
mission:
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi commodo purus vitae odio aliquet ultricies. 
Curabitur feugiat dui et quam malesuada, a accumsan sapien fermentum. Proin blandit lacinia arcu, at accumsan 
lectus scelerisque nec. Morbi fringilla, purus sit amet rutrum malesuada, libero lorem varius arcu, 
nec gravida diam enim ac justo. Phasellus sit amet justo quis arcu euismod tempus. Fusce erat eros, 
placerat vitae leo elementum, eleifend aliquet risus. Donec tempus, ex iaculis rhoncus congue, 
urna diam convallis nisi, sit amet iaculis purus tortor vitae dolor."
)

rocket_vg2 = Rocket.create(name: "White Knight", stages: 1, 
about:
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi commodo purus vitae odio aliquet ultricies. 
Curabitur feugiat dui et quam malesuada, a accumsan sapien fermentum. Proin blandit lacinia arcu, at accumsan 
lectus scelerisque nec. Morbi fringilla, purus sit amet rutrum malesuada, libero lorem varius arcu, 
nec gravida diam enim ac justo. Phasellus sit amet justo quis arcu euismod tempus. Fusce erat eros, 
placerat vitae leo elementum, eleifend aliquet risus. Donec tempus, ex iaculis rhoncus congue, 
urna diam convallis nisi, sit amet iaculis purus tortor vitae dolor.", 
mission:
"Vestibulum accumsan interdum euismod. Suspendisse sed laoreet purus. In hendrerit sapien erat, a tincidunt est viverra ut. 
Proin efficitur eget libero non convallis. Aenean accumsan ut erat non ultricies. Vestibulum non vulputate felis. Vivamus in nisl arcu. 
Etiam molestie, leo eu sollicitudin eleifend, felis dolor vulputate orci, sodales porta nisi lectus a enim. Morbi eu diam et risus blandit ullamcorper et eget massa. 
Cras cursus sapien eu tellus ultrices, sit amet molestie nisi faucibus."
)

boeing = Organization.create(name: "Boeing", about:
<<-text
The world's largest satellite manufacturer; also offering electronic and information solutions, 
strategic missile and defense systems, and other space and intelligence systems. 
The business has more than 60 years of space exploration expertise.
text
)

rocket_b1 = Rocket.create(name: "SLS", stages: 3, 
about:
"Vivamus faucibus malesuada sodales. Vivamus vitae metus a diam lacinia finibus elementum ut sem. 
Proin euismod mi lobortis vehicula ornare. Duis consequat auctor iaculis. Aenean venenatis pellentesque tristique. 
In a nunc lacinia, vulputate velit ut, iaculis nunc. Nullam convallis diam cursus ligula accumsan, vitae molestie eros interdum. 
Sed auctor aliquam nibh, nec ullamcorper nulla efficitur vitae. Phasellus fermentum egestas tempor.", 
mission:
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi commodo purus vitae odio aliquet ultricies. 
Curabitur feugiat dui et quam malesuada, a accumsan sapien fermentum. Proin blandit lacinia arcu, at accumsan 
lectus scelerisque nec. Morbi fringilla, purus sit amet rutrum malesuada, libero lorem varius arcu, 
nec gravida diam enim ac justo. Phasellus sit amet justo quis arcu euismod tempus. Fusce erat eros, 
placerat vitae leo elementum, eleifend aliquet risus. Donec tempus, ex iaculis rhoncus congue, 
urna diam convallis nisi, sit amet iaculis purus tortor vitae dolor."
)

orbital_atk = Organization.create(name: "Orbital ATK", about:
<<-text
As a global leader in aerospace and defense technologies, Orbital ATK designs, builds and delivers space, 
defense and aviation-related systems to customers around the world both as a prime contractor and as a merchant 
supplier. Our main products include launch vehicles and related propulsion systems; satellites and associated 
components and services; composite aerospace structures; tactical missiles, subsystems and defense electronics; 
and precision weapons, armament systems and ammunition. Headquartered in Dulles, Virginia, Orbital ATK employs 
approximately 13,000 people in 18 states across the U.S. and several international locations.
text
)

spacex.rockets << [rocket_sx1,rocket_sx2]
blue_origin.rockets << [rocket_bo1, rocket_bo2]
boeing.rockets << [rocket_b1]
virgin_galactic.rockets << [rocket_vg1, rocket_vg2]

event_sx1 = Event.create(datetime: DateTime.new(2013,2,3,3,5,9), location: "Cape Canaveral, FL")
event_sx2 = Event.create(datetime: DateTime.new(2013,2,5,4,6,6), location: "Cape Canaveral, FL")
event_sx3 = Event.create(datetime: DateTime.new(2013,2,6,4,1,6), location: "Cape Canaveral, FL")
spacex.rockets.first.events << [event_sx1, event_sx2, event_sx3]

event_sx4 = Event.create(datetime: DateTime.new(2014,1,1,3,1,6), location: "Cape Canaveral, FL")
spacex.rockets.last.events << event_sx4

event_bo1 = Event.create(datetime: DateTime.new(2017,11,3,3,5,9), location: "Vandenberg Air Force Base, CA")
event_bo2 = Event.create(datetime: DateTime.new(2017,11,5,4,6,6), location: "Vandenberg Air Force Base, CA")
blue_origin.rockets.first.events << [event_bo1, event_bo2]

event_bo3 = Event.create(datetime: DateTime.new(2015,2,6,4,1,6), location: "Vandenberg Air Force Base, CA")
event_bo4 = Event.create(datetime: DateTime.new(2015,2,7,2,1,9), location: "Vandenberg Air Force Base, CA")
blue_origin.rockets.last.events << [event_bo3, event_bo4]

payload_sx1 = Payload.create(name:"Iridium 3", purpose:"communication satellite", payload_supplier: "Iridium Communications", weight: 689, 
about:
"Iridium 3 was part of a planned commercial communications network comprised of a constellation of 66 LEO spacecraft. The system will 
use L-Band to provide global communications services through portable handsets. A total of 125 spacecraft will be built by Lockheed for 
more than $700M. Commercial service is planned to begin in 1998. The system will employ 15-20 ground stations with a master control complex in Landsdowne, 
VA, a backup in Italy, and a third engineering center in Chandler, AZ. The spacecraft was 3-axis stabilized, with a hydrazine propulsion system. 
It had 2 solar panels with 1-axis articulation. The system employed L-Band using FDMA/TDMA to provide voice at 4.8 kbps and data at 2400 bps with 16 dB margin. 
Each satellite had 48 spot beams for Earth coverage and used Ka-Band for crosslinks and ground commanding."
)
payload_sx2 = Payload.create(name:"Transiting Exoplanet Survey Satellite", purpose:"geologic imaging satellite", payload_supplier: "NASA", weight: 320.0, 
about:
"Vestibulum accumsan interdum euismod. Suspendisse sed laoreet purus. In hendrerit sapien erat, a tincidunt est viverra ut. 
Proin efficitur eget libero non convallis. Aenean accumsan ut erat non ultricies. Vestibulum non vulputate felis. Vivamus in nisl arcu. 
Etiam molestie, leo eu sollicitudin eleifend, felis dolor vulputate orci, sodales porta nisi lectus a enim. Morbi eu diam et risus blandit ullamcorper et eget massa. 
Cras cursus sapien eu tellus ultrices, sit amet molestie nisi faucibus."
)

spacex.rockets.first.payloads << [payload_sx1, payload_sx2]

payload_sx3 = Payload.create(name: "GPS IIIA-2", purpose: "GPS satellite", payload_supplier:"USAF", weight: 3680, 
about:
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi commodo purus vitae odio aliquet ultricies. 
Curabitur feugiat dui et quam malesuada, a accumsan sapien fermentum. Proin blandit lacinia arcu, at accumsan 
lectus scelerisque nec. Morbi fringilla, purus sit amet rutrum malesuada, libero lorem varius arcu, 
nec gravida diam enim ac justo. Phasellus sit amet justo quis arcu euismod tempus. Fusce erat eros, 
placerat vitae leo elementum, eleifend aliquet risus. Donec tempus, ex iaculis rhoncus congue, 
urna diam convallis nisi, sit amet iaculis purus tortor vitae dolor."
)
spacex.rockets.last.payloads << payload_sx3

payload_bo1 = Payload.create(name:"Telstar 19V", purpose:"communications satellite", payload_supplier:"Telesat", weight:432.5, 
about:"Vestibulum accumsan interdum euismod. Suspendisse sed laoreet purus. In hendrerit sapien erat, a tincidunt est viverra ut. 
Proin efficitur eget libero non convallis. Aenean accumsan ut erat non ultricies. Vestibulum non vulputate felis. Vivamus in nisl arcu. 
Etiam molestie, leo eu sollicitudin eleifend, felis dolor vulputate orci, sodales porta nisi lectus a enim. Morbi eu diam et risus blandit ullamcorper et eget massa. 
Cras cursus sapien eu tellus ultrices, sit amet molestie nisi faucibus."
)
blue_origin.rockets.first.payloads << payload_bo1

payload_bo2 = Payload.create(name:"SAOCOM 1B", purpose:"communications satellite", payload_supplier:"CONAE", weight:1605.5, 
about:"Vivamus faucibus malesuada sodales. Vivamus vitae metus a diam lacinia finibus elementum ut sem. 
Proin euismod mi lobortis vehicula ornare. Duis consequat auctor iaculis. Aenean venenatis pellentesque tristique. 
In a nunc lacinia, vulputate velit ut, iaculis nunc. Nullam convallis diam cursus ligula accumsan, vitae molestie eros interdum. 
Sed auctor aliquam nibh, nec ullamcorper nulla efficitur vitae. Phasellus fermentum egestas tempor."
)
blue_origin.rockets.last.payloads << payload_bo2


