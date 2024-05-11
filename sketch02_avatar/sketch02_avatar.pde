// Declare a PImage variable to store the image
PImage img;

// Number of frames to wait before applying effects
int framesToWait = 1;

// Counter to keep track of frames
int frameCounter = 0;

// Flag to determine whether to apply effects
boolean applyEffects = false;

// Setup function runs once at the beginning
void setup() {
  // Set the canvas size
  size(1080, 1080);

  // Set the background color to white
  background(255);

  // Load the image and resize it to fit the canvas
  img = loadImage("mago.jpg");
  img.resize(width, height);

  // Display the original image
  image(img, 0, 0);
}

// Draw function runs continuously
void draw() {
  // Check if the current frame is a multiple of framesToWait
  //framesToWait = int(random(1, 100));
  framesToWait = 1;
  if (frameCounter % framesToWait == 0) {
    // Toggle the flag to apply effects
    applyEffects = !applyEffects;

    // If applying effects, then apply glitch and shift
    if (applyEffects) {
      applyGlitch();
      shiftRows();
      moveRandomRows();
      replaceGreen(color(122, 255, 184));  // Replace verdoso with color 7AFFB8
    } else {
      // If not applying effects, restore the original image
      background(255);
      image(img, 0, 0);
    }
     // Save the frame as an image
    saveFrame("output/frame" + nf(frameCounter, 3) + ".png");
  }

  // Increment the frame counter
  frameCounter++;

  // Check if all frames are rendered
  if (frameCounter >= 12 * framesToWait) {
    noLoop();  // Stop the draw loop
  }
}

// Apply a glitch effect to random pixels in the image
void applyGlitch() {
  // Load the pixels of the image
  loadPixels();

  // Loop through a specified number of times (5770 in this case)
  for (int i = 0; i < 5770; i++) {
    // Get random coordinates within the canvas
    int x = int(random(width));
    int y = int(random(height));

    // Calculate the 1D array index corresponding to the 2D coordinates
    int loc = x + y * width;

    // Generate a random color
    color c = color(random(255), random(255), random(255));

    // Set the pixel color to the random color
    pixels[loc] = c;
  }

  // Update the image with the modified pixels
  updatePixels();
}

// Shift a random number of rows in the image to the right or left
void shiftRows() {
  // Load the pixels of the image
  loadPixels();

  // Get a random number of rows to shift
  int rows = int(random(1, 144));

  // Loop through the specified number of rows
  for (int y = 0; y < rows; y++) {
    // Get a random shift value for each row
    int shift = int(random(-10, 10));

    // Get a random row in the image
    int row = int(random(height));

    // Loop through each pixel in the row
    for (int x = 0; x < width; x++) {
      // Calculate the 1D array index for the current pixel in the row
      int loc = x + row * width;

      // Calculate the 1D array index for the pixel after shifting
      int loc2 = (x + shift) + row * width;

      // Check if the shifted index is within the bounds of the pixel array
      if (loc2 >= 0 && loc2 < pixels.length) {
        // Copy the color of the pixel after shifting to the current pixel
        // Generate a random color
        color c = color(random(255), random(255), random(255));
        pixels[loc] = c;
      }
    }
  }

  // Update the image with the modified pixels
  updatePixels();
}

// Move 4 random rows of 120 pixels to the right or left
// Move a portion of the image (100 pixels in height) to the right or left randomly
void moveRandomRows() {
  // Load the pixels of the image
  loadPixels();

  // Get a random starting row
  int startRow = int(random(0, height - 100));

  // Get a random shift value for the portion
  int shift = int(random(-120, 120));

  // Loop through each row of the portion (100 pixels in height)
  for (int y = startRow; y < startRow + 100; y++) {
    // Loop through each pixel in the row
    for (int x = 0; x < width; x++) {
      // Calculate the 1D array index for the current pixel in the row
      int loc = x + y * width;

      // Calculate the 1D array index for the pixel after shifting
      int loc2 = (x + shift + width) % width + y * width;

      // Copy the color of the pixel after shifting to the current pixel
      pixels[loc] = pixels[loc2];
    }
  }

  // Update the image with the modified pixels
  updatePixels();
}

// Replace greenish pixels with a specified color
void replaceGreen(color replacementColor) {
  // Load the pixels of the image
  loadPixels();

  // Define a threshold for greenish pixels (adjust as needed)
  float greenThreshold = 50;

  // Loop through each pixel
  for (int i = 0; i < pixels.length; i++) {
    // Extract the RGB components of the current pixel
    float r = red(pixels[i]);
    float g = green(pixels[i]);
    float b = blue(pixels[i]);

    // Check if the pixel is greenish
    if (g > r + greenThreshold && g > b + greenThreshold) {
      // Replace greenish pixel with the specified color
      pixels[i] = replacementColor;
    }
  }

  // Update the image with the modified pixels
  updatePixels();
}
