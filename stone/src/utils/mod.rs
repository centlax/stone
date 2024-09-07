use std::fs;
use std::io;
use std::path::Path;

pub fn initialize() -> io::Result<()> {
    let stone_dir = Path::new(".stone");
    if !stone_dir.exists() {
        fs::create_dir(stone_dir)?;
    }

    let meta_dir = stone_dir.join("meta");
    if !meta_dir.exists() {
        fs::create_dir(meta_dir)?;
    }

    let migrations_dir = stone_dir.join("migrations");
    if !migrations_dir.exists() {
        fs::create_dir(migrations_dir)?;
    }

    Ok(())
}
