# tail_tables

Use tailscale to create mesh network.

                
A  ----> B - - - - - - -> C --------> D
      tailscale       tailscale

B,C has tailscaled installed

A and B is in AWS vpc `10.2.0.0/16`, B has internet outbound.

C and D is on-prem `192.168.31.0/24`, C has internet outbound.

We only want to modify settings on A,B,C, not D.

Should consider B,C as a NAT gatway.

Still working on testing

- [ ] A use B to go internet broswering 
- [ ] A use B to access services on D
