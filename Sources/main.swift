#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

import Foundation
import CGLFW
import CGL

var initres = glfwInit()
if(initres != 1) {
  print("Unable to initialize the GLFW3 library")
}

glfwWindowHint(GLFW_SAMPLES, 4);                                    // 4x antialiasing
glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);                      // We want OpenGL 3.3
glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);                      // ''
glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);                // To make MacOS happy; should not be needed
glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);      // Use OpenGL 3.3

var window = glfwCreateWindow( 1024, 768, "GLFW window from SWIFT", nil, nil)
if(window == nil) {
  print("Unable to open a GLFW3 window")
  glfwTerminate()
}

glfwMakeContextCurrent(window);
glfwSetInputMode(window, GLFW_STICKY_KEYS, GL_TRUE);
glClearColor(0.2, 0.2, 0.7, 0.0);
glEnable(GLenum(GL_DEPTH_TEST));

repeat {
  glClear(UInt32(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT));
  glDepthFunc(GLenum(GL_LESS));

  glfwSwapBuffers(window)
  glfwPollEvents()
} while( glfwGetKey(window, GLFW_KEY_ESCAPE ) != GLFW_PRESS && glfwWindowShouldClose(window) == 0 )

glfwTerminate()

