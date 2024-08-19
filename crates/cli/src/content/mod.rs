use std::fs;
use std::path::{Path, PathBuf};

#[allow(dead_code)]
enum Object {
    Table,
    View,
    Function,
    Procedure,
}

#[derive(Debug)]
pub struct Task {
    pub stmt: String, // SQL statement
}

#[derive(Debug)]
pub struct Block {
    pub tasks: Vec<Task>,
}

#[derive(Debug)]
pub struct File {
    pub blocks: Vec<Block>,
    pub path: PathBuf,
}

#[derive(Debug)]
pub struct SQL {
    pub files: Vec<File>,
    pub folder: String,
}

impl SQL {
    pub fn new() -> Self {
        // Define the path for the .maris directory
        let stone_dir = Path::new(".stone");

        // Check if the directory exists, and create it if it does not
        if !stone_dir.exists() {
            if let Err(e) = fs::create_dir(stone_dir) {
                eprintln!("Failed to create directory '.stone': {}", e);
                // Optionally handle the error or propagate it
            }
        }

        Self {
            files: Vec::new(),
            folder: ".stone".to_string()
        }
    }
}
