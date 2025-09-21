## Report Questions (Feature-3 Task-3)

### Q1. Explain the linking rule in this part's Makefile: $(TARGET): $(OBJECTS). How does it differ from a Makefile rule that links against a library?

*Answer:*  
$(TARGET): $(OBJECTS) means the final executable is built by linking all object files (.o) directly. Every compiled source file is explicitly passed to the linker.  
When linking against a library (e.g. main.o -Llib -lmyutils), only the main object(s) are linked, and the linker pulls only the required object modules from the library archive.  
*Difference:* Direct linking always includes all objects, while library linking is modular and uses only the needed parts of the code.

---

### Q2. What is a git tag and why is it useful in a project? What is the difference between a simple tag and an annotated tag?

*Answer:*  
A *git tag* marks a specific commit, useful for versioning and identifying stable project points.  
- *Simple (lightweight) tag:* just a name pointing to a commit, no extra info.  
- *Annotated tag:* a full Git object that stores a message, author, and timestamp. Annotated tags are preferred for official releases.

---

### Q3. What is the purpose of creating a "Release" on GitHub? What is the significance of attaching binaries (like your client executable) to it?

*Answer:*  
A *GitHub Release* is an official snapshot of the project tied to a git tag, published with notes and version info.  
Attaching binaries lets users download and run the program without compiling from source. This ensures consistency, easier distribution, and helps non-technical users.# BSDSF23A013-OS-A01
