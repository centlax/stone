use std::path::PathBuf;


#[derive(Debug)]
pub struct Task {
    pub stmt: String, 
}

#[derive(Debug)]
pub struct Block {
    pub tasks: Vec<Task>,
}


#[derive(Debug)]
pub struct File {
    pub blocks: Vec<Block>,
    pub path: PathBuf,
    pub kind: String
}

#[derive(Debug)]
pub struct Folder {
    pub files: Vec<File>,
    pub path: PathBuf,
    pub name: String,
}


