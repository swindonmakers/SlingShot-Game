#!/usr/bin/python3

# Install https://github.com/micolous/xbox360bb
# Load xbox360bb and joydev

import pygame
 
# Define some colors
BLACK = (  0,   0,   0)
WHITE = (255, 255, 255)
GREEN = (134,   0, 100)
 
pygame.init()
 
# Set the height and width of the screen
size = [700, 350]
screen = pygame.display.set_mode(size, pygame.FULLSCREEN)
 
pygame.display.set_caption("Slingshot Timer")
 
# Loop until the user clicks the close button.
done = False
 
# Used to manage how fast the screen updates
clock = pygame.time.Clock()
 
font = pygame.font.Font(None, 120)
print("Size: %d, %d" % font.size("12:34"))
 
frame_count = 0
frame_rate = 60
start_time = 90

# Initialize the joysticks
pygame.joystick.init()
pygame.joystick.Joystick(0).init()

# Timer status
timer = False
freeze_mins = 0
freeze_secs = 0

# -------- Main Program Loop -----------
while not done:
    for event in pygame.event.get():  # User did something
        if event.type == pygame.QUIT:  # If user clicked close
            done = True  # Flag that we are done so we exit this loop
        if event.type == pygame.JOYBUTTONDOWN and event.button == 6:
            timer = not timer
        if timer == True:
            frame_count = 0
 
    # Set the screen background
    screen.fill(BLACK)
 
    # ALL CODE TO DRAW SHOULD GO BELOW THIS COMMENT
    minutes = freeze_mins
    seconds = freeze_secs
    if timer:
        # --- Timer going up ---
        # Calculate total seconds
        total_seconds = frame_count // frame_rate
 
        # Divide by 60 to get total minutes
        minutes = total_seconds // 60
 
        # Use modulus (remainder) to get seconds
        seconds = total_seconds % 60

        freeze_mins = minutes
        freeze_secs = seconds

    # Use python string formatting to format in leading zeros
    output_string = "{0:02}:{1:02}".format(minutes, seconds)
 
    # Blit to the screen
    text = font.render(output_string, True, GREEN)
    screen.blit(text, [250, 150]) 
 
    # ALL CODE TO DRAW SHOULD GO ABOVE THIS COMMENT
    frame_count += 1
 
    # Limit frames per second
    clock.tick(frame_rate)
 
    # Go ahead and update the screen with what we've drawn.
    pygame.display.flip()
 
# Be IDLE friendly. If you forget this line, the program will 'hang'
# on exit.
pygame.quit()
