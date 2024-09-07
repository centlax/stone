mod utils;
mod content;
mod scan;
use std::io::Result;


fn main() -> Result<()> {
    println!("Hello, world!");
    utils::initialize()?;
    Ok(())
}


